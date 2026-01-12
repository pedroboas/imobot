from bs4 import BeautifulSoup
import re

def parse_era(html_content):
    """
    Parser for ERA.pt listings.
    Targets elements with 'property-item' or 'card-property' classes.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # ERA listings often use 'property-item' or 'card-property'
    listings = soup.find_all(['div', 'article'], class_=re.compile(r'property-item|card-property|listing-item', re.I))
    
    if not listings:
        # Try finding by links that look like property links
        all_links = soup.find_all('a', href=re.compile(r'/imovel/|/p/'))
        for link in all_links:
            parent = link.find_parent(['div', 'article'])
            if parent and parent not in listings:
                listings.append(parent)

    for item in listings:
        try:
            link_tag = item.find('a', href=True)
            if not link_tag: continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.era.pt" + url
                
            title_tag = item.find(['h2', 'h3', 'h4'])
            title = title_tag.get_text(strip=True) if title_tag else "ERA Property"
            
            price_tag = item.find(class_=re.compile(r'price|valor', re.I))
            if not price_tag:
                 price_tag = item.find(string=re.compile(r'€', re.I))
            
            price = price_tag.get_text(strip=True) if hasattr(price_tag, 'get_text') else (price_tag if price_tag else "N/A")
            
            prop_id = item.get('data-id') or re.search(r'/(\d+)$', url.split('?')[0])
            if isinstance(prop_id, re.Match):
                prop_id = prop_id.group(1)
            
            if not prop_id:
                prop_id = str(hash(url))

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'era'
            })
        except:
            continue
            
    return properties
