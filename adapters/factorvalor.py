from bs4 import BeautifulSoup
import re
import hashlib

def parse_factorvalor(html_content):
    """
    Parser for factorvalor.pt.
    The listing container is an <a> tag with class 'propertyItemWrap'.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Listings are wrapped in 'propertyItem' divs
    listings = soup.find_all('div', class_=re.compile(r'propertyItem', re.I))
    
    for item in listings:
        try:
            link_tag = item.find('a', class_=re.compile(r'propertyItemWrap', re.I))
            if not link_tag: continue
            
            url = link_tag.get('href')
            if not url: continue
            if not url.startswith('http'):
                url = "https://www.factorvalor.pt" + url
            
            # Title
            title_tag = item.find('span', class_='box-title') or item.find('h2', class_='propertyTitle')
            title = title_tag.get_text(strip=True) if title_tag else "Imóvel FactorValor"
            
            # Price
            price_tag = item.find('div', class_='propertyPrice') or \
                        item.find(class_=re.compile(r'price|valor', re.I))
            
            price = price_tag.get_text(strip=True) if price_tag else "Preço sob consulta"
            
            # ID extraction from data-stickeridentifier or URL
            prop_id = item.get('data-stickeridentifier')
            if not prop_id:
                id_match = re.search(r'/(\d+)$', url.split('?')[0])
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'factorvalor'
            })
        except Exception as e:
            print(f"Erro ao processar um item de FactorValor: {e}")
            
    return properties
