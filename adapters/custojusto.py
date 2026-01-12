from bs4 import BeautifulSoup
import re

def parse_custojusto(html_content):
    """
    Parser for CustoJusto.pt listings.
    Targets listing-item patterns and extracts IDs directly from URL structures when possible.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # CustoJusto listings are likely 'a' tags with specific classes
    listings = soup.find_all('a', class_=re.compile(r'itemCard_link'))
    
    for item in listings:
        try:
            # Extract ID from id attribute
            prop_id = item.get('id')
            
            # URL and Title
            url = item.get('href', "")
            if url and not url.startswith('http'):
                url = "https://www.custojusto.pt" + url
                
            title = item.get('title') or "Sem título"
            
            # Price
            price_tag = item.find('h5')
            price = price_tag.get_text(strip=True) if price_tag else "Preço não disponível"

            if not prop_id and url:
                prop_id = str(hash(url))

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'custojusto'
            })
        except Exception as e:
            print(f"Erro ao processar um item do CustoJusto: {e}")
            
    return properties
