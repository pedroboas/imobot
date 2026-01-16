from bs4 import BeautifulSoup
import re
import hashlib

def parse_olx(html_content):
    """
    Parser for OLX.pt listings.
    Targets elements with 'data-testid="l-card"' and extracts property details.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # OLX listings are in cards with data-testid="l-card"
    listings = soup.find_all('div', {'data-testid': 'l-card'})
    
    for item in listings:
        try:
            # Extract ID from id attribute
            prop_id = item.get('id')
            
            # Link and Title
            link_tag = item.find('a', href=True)
            url = link_tag['href'] if link_tag else ""
            if url and not url.startswith('http'):
                url = "https://www.olx.pt" + url
            
            title_tag = item.find('h6')
            title = title_tag.get_text(strip=True) if title_tag else "Sem título"
            
            # Price
            price_tag = item.find('p', {'data-testid': 'ad-price'})
            price = price_tag.get_text(strip=True) if price_tag else "Preço não disponível"

            if not prop_id and url:
                prop_id = hashlib.md5(url.encode()).hexdigest()

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'olx'
            })
        except Exception as e:
            print(f"Erro ao processar um item do OLX: {e}")
            
    return properties
