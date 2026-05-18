from bs4 import BeautifulSoup
import re
import json
import hashlib

def parse_zome(html_content):
    """
    Parser for Zome.pt listings.
    Zome is a React SPA. Strategies:
      1. Parse rendered DOM for ListingPreviewItem cards
      2. Look for JSON data in script tags (__NEXT_DATA__ or inline state)
      3. Find property links (/pt/imovel/ or ZMPT patterns)
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    seen_ids = set()
    
    # Strategy 1: Find ListingPreviewItem cards (rendered React components)
    listings = soup.find_all('div', class_=re.compile(r'ListingPreviewItem|PropertyCard|property-card', re.I))
    
    for item in listings:
        try:
            # Link and URL
            link_tag = item.find('a', href=re.compile(r'/imovel/|ZMPT', re.I))
            if not link_tag:
                link_tag = item.find('a', class_=re.compile(r'text-decoration-none', re.I))
            if not link_tag:
                link_tag = item.find('a', href=True)
            if not link_tag:
                continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.zome.pt" + url
                
            # Title
            title_tag = item.find(['h2', 'h3', 'h4'])
            if not title_tag:
                title_tag = item.find(class_=re.compile(r'title|name|location', re.I))
            title = title_tag.get_text(strip=True) if title_tag else "Zome Property"
            
            # Price  
            price_tag = item.find(class_=re.compile(r'price|valor|Price', re.I))
            if not price_tag:
                price_tag = item.find(string=re.compile(r'[\d.,]+\s*€', re.I))
            
            if hasattr(price_tag, 'get_text'):
                price = price_tag.get_text(strip=True)
            elif price_tag:
                price = price_tag.strip()
            else:
                price = "N/A"
            
            # ID: Zome uses ZMPT IDs in URLs
            id_match = re.search(r'(ZMPT\d+)', url, re.I)
            if id_match:
                prop_id = id_match.group(1)
            else:
                id_match = re.search(r'/imovel/[^/]*?(\d{4,})', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
            
            if prop_id not in seen_ids:
                seen_ids.add(prop_id)
                properties.append({
                    'id': prop_id,
                    'title': title,
                    'url': url,
                    'price': price,
                    'site': 'zome'
                })
        except Exception:
            continue
    
    if properties:
        return properties
    
    # Strategy 2: Find all property links in the page
    property_links = soup.find_all('a', href=re.compile(r'/pt/imovel/|/imovel/.*ZMPT', re.I))
    
    for link in property_links:
        try:
            url = link['href']
            if not url.startswith('http'):
                url = "https://www.zome.pt" + url
            
            # Extract ZMPT ID
            id_match = re.search(r'(ZMPT\d+)', url, re.I)
            prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
            
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)
            
            # Walk up to find container with title and price
            container = link.parent
            for _ in range(5):
                if container is None:
                    break
                if container.find(string=re.compile(r'€', re.I)):
                    break
                container = container.parent
            
            title = link.get_text(strip=True) or link.get('title', 'Zome Property')
            if len(title) < 5:
                if container:
                    h_tag = container.find(['h2', 'h3', 'h4'])
                    title = h_tag.get_text(strip=True) if h_tag else 'Zome Property'
            
            price = "N/A"
            if container:
                price_el = container.find(string=re.compile(r'[\d.,]+\s*€', re.I))
                if price_el:
                    price = price_el.strip()
            
            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'zome'
            })
        except Exception:
            continue
    
    # Strategy 3: Try JSON extraction from script tags
    if not properties:
        for script in soup.find_all('script'):
            text = script.string or ''
            # Look for listing data in inline scripts
            zmpt_matches = re.findall(r'(ZMPT\d+)', text)
            if len(zmpt_matches) > 2:
                try:
                    # Try to parse as JSON
                    data = json.loads(text)
                    # Navigate known structures
                    if isinstance(data, dict):
                        _extract_from_json(data, properties, seen_ids)
                except Exception:
                    pass
    
    return properties


def _extract_from_json(data, properties, seen_ids, depth=0):
    """Recursively search JSON for listing data."""
    if depth > 5:
        return
    
    if isinstance(data, dict):
        # Check if this dict looks like a listing
        if 'listingId' in data or 'zmptId' in data or 'ZMPT' in str(data.get('reference', '')):
            prop_id = str(data.get('zmptId', data.get('listingId', data.get('reference', ''))))
            url = data.get('url', data.get('detailUrl', ''))
            if url and not url.startswith('http'):
                url = "https://www.zome.pt" + url
            title = data.get('title', data.get('description', 'Zome Property'))
            price = data.get('price', data.get('priceLabel', 'N/A'))
            if isinstance(price, (int, float)):
                price = f"{int(price):,} €".replace(',', '.')
            
            if prop_id and prop_id not in seen_ids:
                seen_ids.add(prop_id)
                properties.append({
                    'id': prop_id,
                    'title': str(title)[:100],
                    'url': url,
                    'price': str(price),
                    'site': 'zome'
                })
            return
        
        for value in data.values():
            _extract_from_json(value, properties, seen_ids, depth + 1)
    
    elif isinstance(data, list):
        for item in data:
            _extract_from_json(item, properties, seen_ids, depth + 1)
