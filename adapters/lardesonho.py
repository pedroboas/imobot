from bs4 import BeautifulSoup
import re
import hashlib

def parse_lardesonho(html_content):
    """
    Parser for lardesonho.pt listings.
    Structure:
      - Listing cards are in div.destaque-box-wrapper
      - Property links: a[href*="/imovel/?propertyId="]
      - Prices in div.overlay-price-wrapper
      - Titles extracted from URL slugs (e.g., Apartamento-T2-Vila-Boa-Barcelos-Compra)
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    seen_ids = set()

    # Find all property links
    property_links = soup.find_all('a', href=re.compile(r'/imovel/.*propertyId=\d+', re.I))
    
    for link in property_links:
        try:
            url = link['href']
            if not url.startswith('http'):
                url = "https://www.lardesonho.pt" + url
            
            # Extract propertyId from URL
            id_match = re.search(r'propertyId=(\d+)', url)
            prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
            
            # Skip duplicates (multiple links per card)
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)
            
            # Extract title from URL slug
            # URL: /imovel/Apartamento-T2-Vila-Boa-Barcelos-Compra/?propertyId=4443963
            slug_match = re.search(r'/imovel/([^/?]+)', url)
            if slug_match:
                slug = slug_match.group(1)
                # Convert hyphens to spaces for readable title
                title = slug.replace('-', ' ')
                # Remove trailing "Compra" or "Arrendamento"
                title = re.sub(r'\s+(Compra|Arrendamento)\s*$', '', title, flags=re.I)
            else:
                title = "Lar de Sonho Property"
            
            # Find price - walk up to the card container
            price = "N/A"
            container = link.parent
            for _ in range(8):
                if container is None:
                    break
                # Check for price element
                price_el = container.find(class_=re.compile(r'overlay-price-wrapper|price', re.I))
                if price_el:
                    price = price_el.get_text(strip=True)
                    break
                # Also check for € in text
                price_text = container.find(string=re.compile(r'[\d.,]+\s*€', re.I))
                if price_text:
                    price = price_text.strip()
                    break
                container = container.parent
            
            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'lardesonho'
            })
        except Exception:
            continue
    
    # Fallback: try finding cards by container class
    if not properties:
        cards = soup.find_all('div', class_=re.compile(r'destaque-box-wrapper', re.I))
        for card in cards:
            try:
                link_tag = card.find('a', href=True)
                if not link_tag:
                    continue
                
                url = link_tag['href']
                if not url.startswith('http'):
                    url = "https://www.lardesonho.pt" + url
                
                id_match = re.search(r'propertyId=(\d+)', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()
                
                if prop_id in seen_ids:
                    continue
                seen_ids.add(prop_id)
                
                title_tag = card.find(['h2', 'h3', 'h4', 'h5'])
                title = title_tag.get_text(strip=True) if title_tag else "Lar de Sonho Property"
                
                price_tag = card.find(class_=re.compile(r'price|overlay-price', re.I))
                price = price_tag.get_text(strip=True) if price_tag else "N/A"
                
                properties.append({
                    'id': prop_id,
                    'title': title,
                    'url': url,
                    'price': price,
                    'site': 'lardesonho'
                })
            except Exception:
                continue
    
    return properties
