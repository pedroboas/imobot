from bs4 import BeautifulSoup
import re
import hashlib

def parse_casasapo(html_content):
    """
    Parser for Casa.Sapo.pt listings.
    Extracts property ID, title, URL, and price from standard CasaSapo search results.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Casa SAPO listings
    listings = soup.find_all('div', class_=re.compile(r'searchItem'))
    
    for item in listings:
        try:
            # Extract ID from data-id
            prop_id = item.get('data-id')
            
            # Title
            title_tag = item.find('span', class_='searchItemTitle')
            title = title_tag.get_text(strip=True) if title_tag else "Sem título"
            
            # URL
            link_tag = item.find('a', href=True)
            url = link_tag['href'] if link_tag else ""
            if url and not url.startswith('http'):
                url = "https://casa.sapo.pt" + url
            
            # Price
            price_tag = item.find('span', class_='searchItemValue')
            price = price_tag.get_text(strip=True) if price_tag else "Preço não disponível"

            if not prop_id and url:
                prop_id = hashlib.md5(url.encode()).hexdigest()

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'casasapo'
            })
        except Exception as e:
            print(f"Erro ao processar um item do Casa SAPO: {e}")
            
    return properties
