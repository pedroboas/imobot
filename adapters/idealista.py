from bs4 import BeautifulSoup
import re

def parse_idealista(html_content):
    """
    Parser for Idealista.pt listings.
    Targets 'article' elements with the 'item' class. Includes logic to skip advertisement blocks.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Idealista listings are usually in 'article' tags with class 'item'
    listings = soup.find_all('article', class_=re.compile(r'item'))
    
    for item in listings:
        try:
            # Skip ads
            if 'item-ad' in item.get('class', []):
                continue
                
            # Extract ID from data-ad-id or data-element-id
            prop_id = item.get('data-ad-id') or item.get('data-element-id')
            
            # Title and Link
            link_tag = item.find('a', class_='item-link')
            if not link_tag:
                link_tag = item.find('a', href=True)
                
            title = link_tag.get('title') or link_tag.get_text(strip=True) if link_tag else "Sem título"
            url = link_tag['href'] if link_tag else ""
            if url and not url.startswith('http'):
                url = "https://www.idealista.pt" + url
            
            # Price
            price_tag = item.find(class_=re.compile(r'item-price'))
            price = price_tag.get_text(strip=True) if price_tag else "Preço sob consulta"

            if not prop_id and url:
                # Try to extract ID from URL (e.g., /imovel/12345678/)
                match = re.search(r'/imovel/(\d+)', url)
                if match:
                    prop_id = match.group(1)
                else:
                    prop_id = str(hash(url))

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'idealista'
            })
        except Exception as e:
            print(f"Erro ao processar um item do Idealista: {e}")
            
    return properties
