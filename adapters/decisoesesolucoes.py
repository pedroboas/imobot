from bs4 import BeautifulSoup
import re
from urllib.parse import urlparse, parse_qs

def parse_decisoesesolucoes(html_content):
    """
    Parser for decisoesesolucoes.com listings.
    Targets elements with 'property-card' class.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Each listing is in a 'property-card' div
    cards = soup.find_all('div', class_='property-card')
    
    for card in cards:
        try:
            # 1. Link & ID
            # formatting: https://www.decisoesesolucoes.com/propriedade/?ref=...&id=771422
            link_tag = card.find('a', class_='btn') or card.find('a', href=True)
            if not link_tag:
                # Sometimes the whole card is an anchor, or wrapped in one
                parent_a = card.find_parent('a')
                if parent_a:
                    link_tag = parent_a
                else:
                    continue

            url = link_tag['href']
            if not url.startswith('http'):
                url = "https://www.decisoesesolucoes.com" + url

            # Extract ID from URL query param 'id'
            parsed_url = urlparse(url)
            query_params = parse_qs(parsed_url.query)
            prop_id = query_params.get('id', [None])[0]

            if not prop_id:
                # Fallback: maybe just hash the URL or look for other patterns
                prop_id = re.search(r'id=(\d+)', url)
                if prop_id: prop_id = prop_id.group(1)
            
            if not prop_id:
                prop_id = url  # Fallback to URL if no ID found

            # 2. Title
            # Structure: <div class="card-content"><header><h3>Title</h3>...
            title_tag = card.find('h3')
            title = title_tag.get_text(strip=True) if title_tag else "Decisões e Soluções Property"

            # 3. Price
            # <span class="price" itemprop="price">350.000 €</span>
            price_tag = card.find(class_='price')
            price = price_tag.get_text(strip=True) if price_tag else "N/A"

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'decisoesesolucoes'
            })
            
        except Exception as e:
            continue
            
    return properties
