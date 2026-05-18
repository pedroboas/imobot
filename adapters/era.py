from bs4 import BeautifulSoup
import re
import hashlib

def parse_era(html_content):
    """
    Parser for ERA.pt listings.
    ERA uses a standard server-rendered page with:
      - div.card containers for each listing
      - a.card__gallery links to property detail pages (/imovel/...)
      - span/div with class 'card__price' or 'price-value' for prices
      - h3/h4 or spans with location/type info for titles
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    seen_ids = set()

    # Primary strategy: Find links to property detail pages
    property_links = soup.find_all('a', href=re.compile(r'/imovel/', re.I))
    
    for link in property_links:
        try:
            url = link['href']
            if not url.startswith('http'):
                url = "https://www.era.pt" + url
            
            # Extract property ID from URL: /imovel/venda-apartamento-.../123456
            id_match = re.search(r'/(\d{4,})(?:\?|$|#)', url)
            if not id_match:
                # Try from URL path segments
                id_match = re.search(r'/imovel/[^/]+/(\d+)', url)
            
            prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
            
            # Skip if already seen (multiple links per card)
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)
            
            # Navigate up to find the card container
            card = link.find_parent('div', class_=re.compile(r'card|listing|property', re.I))
            if not card:
                card = link.parent
                for _ in range(5):
                    if card is None:
                        break
                    if card.name == 'div' and card.get('class'):
                        break
                    card = card.parent
            
            if not card:
                card = link.parent
            
            # Title: combine location + type info
            title = ""
            
            # Try structured title elements
            if card:
                title_tag = card.find(['h2', 'h3', 'h4'])
                if title_tag:
                    title = title_tag.get_text(strip=True)
                
                if not title or len(title) < 5:
                    # Look for card__type and card__location classes
                    type_el = card.find(class_=re.compile(r'card__type|type|tipologia', re.I))
                    loc_el = card.find(class_=re.compile(r'card__location|location|localizacao|morada', re.I))
                    
                    parts = []
                    if type_el:
                        parts.append(type_el.get_text(strip=True))
                    if loc_el:
                        parts.append(loc_el.get_text(strip=True))
                    if parts:
                        title = ' - '.join(parts)
            
            if not title or len(title) < 5:
                title = link.get('title', '') or link.get_text(strip=True)[:100]
            if not title or len(title) < 3:
                title = "ERA Property"
            
            # Price
            price = "N/A"
            if card:
                price_tag = card.find(class_=re.compile(r'price|valor|card__price', re.I))
                if price_tag:
                    price = price_tag.get_text(strip=True)
                else:
                    # Look for € symbol
                    price_text = card.find(string=re.compile(r'[\d.,]+\s*€', re.I))
                    if price_text:
                        price = price_text.strip()
            
            # Skip entries that don't look like real properties
            if 'agencia' in url.lower() or '/comprar' == url.rstrip('/').lower():
                continue
            
            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'era'
            })
        except Exception:
            continue
    
    # Fallback: If no property links found, try card-based approach
    if not properties:
        listings = soup.find_all('div', class_=re.compile(r'card', re.I))
        for item in listings:
            try:
                link_tag = item.find('a', href=True)
                if not link_tag:
                    continue
                
                url = link_tag['href']
                if '/imovel/' not in url.lower():
                    continue
                if not url.startswith('http'):
                    url = "https://www.era.pt" + url
                
                title_tag = item.find(['h2', 'h3', 'h4'])
                title = title_tag.get_text(strip=True) if title_tag else "ERA Property"
                
                price_tag = item.find(class_=re.compile(r'price|valor', re.I))
                price = price_tag.get_text(strip=True) if price_tag else "N/A"
                
                id_match = re.search(r'/(\d{4,})', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
                
                if prop_id not in seen_ids:
                    seen_ids.add(prop_id)
                    properties.append({
                        'id': str(prop_id),
                        'title': title,
                        'url': url,
                        'price': price,
                        'site': 'era'
                    })
            except Exception:
                continue
            
    return properties
