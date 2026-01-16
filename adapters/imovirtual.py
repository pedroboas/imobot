from bs4 import BeautifulSoup
import re
import hashlib

def parse_imovirtual(html_content):
    """
    Parser for Imovirtual.com listings.
    Identifies 'article' tags with 'data-testid="listing-item"' and extracts ID, title, URL, and price.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Imovirtual listings are usually in 'article' tags with data-testid="listing-item"
    # New structure uses data-sentry-component="AdvertCard" or data-testid="listing-ad"
    listings = soup.find_all('article', {'data-sentry-component': 'AdvertCard'}) or \
               soup.find_all('article', {'data-testid': 'listing-ad'}) or \
               soup.find_all('article', {'data-testid': 'listing-item'})
    
    for item in listings:
        try:
            # Title and URL mapping - New structure uses data-cy attributes
            link_tag = item.find('a', {'data-cy': 'listing-item-link'}) or item.find('a', href=True)
            if not link_tag:
                continue

            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.imovirtual.com" + url

            title_tag = item.find('p', {'data-cy': 'listing-item-title'}) or \
                        item.find('h3') or \
                        link_tag
            title = title_tag.get_text(strip=True) if title_tag else "Sem título"
            
            # Price
            price_container = item.find('span', {'data-testid': 'listing-item-price'}) or \
                              item.find(lambda tag: tag.name in ['span', 'p'] and '€' in tag.get_text())
            
            price = price_container.get_text(strip=True) if price_container else "Preço sob consulta"

            # Prop ID extraction from URL (e.g., ...-ID1hDdP)
            prop_id = None
            id_match = re.search(r'-ID([a-zA-Z0-9]+)$', url)
            if id_match:
                prop_id = id_match.group(1)
            else:
                prop_id = item.get('id') or item.get('data-item-id') or hashlib.md5(url.encode()).hexdigest()

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'imovirtual'
            })
        except Exception as e:
            print(f"Erro ao processar um item de Imovirtual: {e}")
            
    return properties
