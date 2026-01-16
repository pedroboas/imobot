from bs4 import BeautifulSoup
import re
import urllib.parse
import hashlib

BLACKLIST_KEYWORDS = [
    'facebook.com', 'whatsapp.com', 'twitter.com', 'pinterest.com', 
    'linkedin.com', 'share', 'messenger', 'mailto:', 'tel:', 
    'instagram.com', 'youtube.com'
]

def is_social_link(url):
    """
    Checks if a URL belongs to a social media platform or is a sharing link.
    """
    url_lower = url.lower()
    return any(keyword in url_lower for keyword in BLACKLIST_KEYWORDS)

def parse_generic_logic(html_content, base_url):
    """
    Universal Fallback Parser.
    Uses heuristic patterns (article/div class names like 'item', 'property') to 
    find property listings on unsupported sites.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Common containers for real estate listings
    patterns = [
        {'tag': 'article', 'class_': re.compile(r'item|property|listing|card', re.I)},
        {'tag': 'div', 'class_': re.compile(r'item|property|listing|card|product', re.I)},
        {'tag': 'li', 'class_': re.compile(r'item|property|listing|card', re.I)},
    ]
    
    listings = []
    for p in patterns:
        found = soup.find_all(p['tag'], class_=p['class_'])
        if len(found) >= 3: # Lowered threshold slightly
            listings = found
            break
            
    if not listings:
        # Fallback: look for all links that might be dynamic property links
        all_links = soup.find_all('a', href=True)
        # Filter typical "property" links but exclude social ones
        potential_links = [
            l for l in all_links 
            if re.search(r'/imovel/|/p/|/propriedade/|/detalhe/|/venda/', l['href'], re.I)
            and not is_social_link(l['href'])
        ]
        # This is a bit too broad for generic, but helpful if structure is unknown
        pass

    for item in listings:
        try:
            # URL (Critical)
            link_tag = item.find('a', href=True)
            if not link_tag and item.name == 'a':
                link_tag = item
            
            if not link_tag: continue
            
            url = link_tag['href']
            if is_social_link(url):
                continue

            # Heuristic: Valid property links usually have some distance or depth
            # and aren't just "#" or "/"
            if len(url) < 10 or url.startswith('#'):
                continue

            if url and not url.startswith('http'):
                url = urllib.parse.urljoin(base_url, url)
            
            # Title
            title_tag = item.find(['h2', 'h3', 'h4', 'span'], class_=re.compile(r'title|name|header', re.I))
            if not title_tag:
                title_tag = item.find(['h2', 'h3', 'h4'])
            title = title_tag.get_text(strip=True) if title_tag else "Imóvel"
            
            if len(title) < 5: # Skip very short titles (noise)
                continue

            # Price
            price_tag = item.find(string=re.compile(r'€|EUR|\d+[\.,]\d+\s?€', re.I))
            if price_tag and price_tag.parent:
                price = price_tag.parent.get_text(strip=True)
            else:
                # If no price is found, the likelihood of it being a listing in this generic parser is lower
                # but we'll still keep it if it's broad enough. 
                # HOWEVER, for concretaimobiliaria, it might be the reason for 96 results.
                # Let's require a price for generic if found too many items.
                if len(listings) > 20:
                    continue
                price = "Preço sob consulta"
                
            # ID
            prop_id = item.get('id') or item.get('data-id') or item.get('data-ad-id')
            if not prop_id:
                # Use a mix of URL path and hex hash for better consistency
                path = urllib.parse.urlparse(url).path
                prop_id = f"gen_{hashlib.md5(path.encode()).hexdigest()}"

            if url and prop_id:
                properties.append({
                    'id': prop_id,
                    'title': title,
                    'url': url,
                    'price': price,
                    'site': urllib.parse.urlparse(base_url).netloc
                })
        except Exception:
            continue
            
    return properties
