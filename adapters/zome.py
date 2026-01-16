from bs4 import BeautifulSoup
import re
import hashlib

def parse_zome(html_content):
    """
    Parser for Zome.pt listings.
    Identifies 'property-card' or 'property-item' elements and parses details.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Zome listings often have 'property-card' or 'property-item'
    # New structure uses 'ListingPreviewItem'
    listings = soup.find_all('div', class_=re.compile(r'ListingPreviewItem|property-card', re.I))
    
    for item in listings:
        try:
            # Link and URL
            link_tag = item.find('a', class_=re.compile(r'text-decoration-none', re.I)) or item.find('a', href=True)
            if not link_tag: continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.zome.pt" + url
                
            # Title
            title_tag = item.find(['h2', 'h3', 'h4']) or link_tag
            title = title_tag.get_text(strip=True) if title_tag else "Zome Property"
            
            # Price
            price_tag = item.find(class_=re.compile(r'price|valor|ListingPreviewItem__price', re.I)) or \
                        item.find(string=re.compile(r'€', re.I))
            
            price = price_tag.get_text(strip=True) if hasattr(price_tag, 'get_text') else (price_tag if price_tag else "N/A")
            
            # ID
            # Zome often puts ZMPT ID in the URL
            id_match = re.search(r'ZMPT(\d+)', url)
            prop_id = id_match.group(0) if id_match else (item.get('data-id') or item.get('data-property-id') or hashlib.md5(url.encode()).hexdigest())

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'zome'
            })
        except:
            continue
            
    return properties
