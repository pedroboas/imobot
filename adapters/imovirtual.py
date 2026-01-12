from bs4 import BeautifulSoup
import re

def parse_imovirtual(html_content):
    """
    Parser for Imovirtual.com listings.
    Identifies 'article' tags with 'data-testid="listing-item"' and extracts ID, title, URL, and price.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Imovirtual listings are usually in 'article' tags with data-testid="listing-item"
    listings = soup.find_all('article', {'data-testid': 'listing-item'})
    
    for item in listings:
        try:
            # Extract ID (usually in data-cy or part of the URL)
            # Imovirtual often has id in data-item-id
            prop_id = item.get('id') or item.get('data-item-id')
            
            # Title
            title_tag = item.find('h3')
            title = title_tag.get_text(strip=True) if title_tag else "Sem título"
            
            # URL
            link_tag = item.find('a', href=True)
            url = link_tag['href'] if link_tag else ""
            if url and not url.startswith('http'):
                url = "https://www.imovirtual.com" + url
            
            # Price
            price_tag = item.find('span', string=re.compile(r'€'))
            if not price_tag:
                 price_tag = item.find('p', string=re.compile(r'€')) # Fallback
            
            # Sometimes price is in a specific data-testid
            price_container = item.find('span', {'data-testid': 'listing-item-price'})
            price = price_container.get_text(strip=True) if price_container else (price_tag.get_text(strip=True) if price_tag else "Preço sob consulta")

            if not prop_id and url:
                # Fallback to URL hash if ID is missing
                prop_id = str(hash(url))

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
