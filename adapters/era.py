from bs4 import BeautifulSoup
import re
import hashlib

def parse_era(html_content):
    """
    Parser for ERA.pt listings.
    Targets elements with 'property-item' or 'card-property' classes.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # ERA listings often use 'property-item' or 'card-property'
    # New structure uses div.card and a.card-anchor
    listings = soup.find_all('div', class_=re.compile(r'card|property-item|listing-card|item-property', re.I))
    
    if not listings:
        # Fallback to links if classes aren't found
        all_links = soup.find_all('a', class_=re.compile(r'card-anchor|card__gallery', re.I))
        listings = [link.find_parent('div', class_=re.compile(r'card|body|content', re.I)) or link.parent.parent for link in all_links]

    for item in listings:
        try:
            # Anchor tag contains the main info
            link_tag = item.find('a', class_=re.compile(r'card-anchor|card__gallery', re.I)) or item.find('a', href=True)
            if not link_tag: continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.era.pt" + url
                
            # Title
            title_tag = item.find(['h2', 'h3', 'h4']) or item.find(class_=re.compile(r'location|type', re.I)) or link_tag
            title = title_tag.get_text(strip=True) if title_tag else "ERA Property"
            
            # Price
            price_tag = item.find('p', class_='price-value') or \
                        item.find(class_=re.compile(r'price|valor|card__price', re.I)) or \
                        item.find(string=re.compile(r'€', re.I))
            
            price = price_tag.get_text(strip=True) if hasattr(price_tag, 'get_text') else (price_tag if price_tag else "N/A")
            
            # ID extraction from carousel ID or URL
            prop_id = None
            carousel = item.find('div', id=re.compile(r'carousel-(\d+)'))
            if carousel:
                prop_id = re.search(r'carousel-(\d+)', carousel['id']).group(1)
            
            if not prop_id:
                prop_id = item.get('data-id') or re.search(r'/(\d+)$', url.split('?')[0])
                if prop_id and not isinstance(prop_id, str):
                    prop_id = prop_id.group(1)
            
            if not prop_id:
                prop_id = hashlib.md5(url.encode()).hexdigest()

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'era'
            })
        except:
            continue
            
    return properties
