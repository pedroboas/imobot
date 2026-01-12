from bs4 import BeautifulSoup
import re

def parse_zome(html_content):
    """
    Parser for Zome.pt listings.
    Identifies 'property-card' or 'property-item' elements and parses details.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Zome listings often have 'property-card' or 'property-item'
    listings = soup.find_all(['div', 'article'], class_=re.compile(r'property-card|property-item|card', re.I))
    
    for item in listings:
        try:
            link_tag = item.find('a', href=True)
            if not link_tag: continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.zome.pt" + url
                
            title_tag = item.find(['h2', 'h3', 'h4'])
            title = title_tag.get_text(strip=True) if title_tag else "Zome Property"
            
            price_tag = item.find(class_=re.compile(r'price|valor', re.I))
            if not price_tag:
                price_tag = item.find(string=re.compile(r'€', re.I))
                
            price = price_tag.get_text(strip=True) if hasattr(price_tag, 'get_text') else (price_tag if price_tag else "N/A")
            
            prop_id = item.get('data-id') or item.get('data-property-id') or str(hash(url))

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
