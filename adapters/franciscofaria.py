from bs4 import BeautifulSoup
import re
import hashlib

def parse_franciscofaria(html_content):
    """
    Parser for franciscofaria.pt (Houzez Theme).
    Extracts property ID, title, URL, and price from search result cards.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Houzez theme listings
    listings = soup.find_all('div', class_='item-listing-wrap')
    
    for item in listings:
        try:
            # Property ID - use data-hz-id if present, else hash the URL
            prop_id = item.get('data-hz-id')
            
            # Title and URL
            title_tag = item.find('h2', class_='item-title') or item.find('h3', class_='item-title')
            link_tag = title_tag.find('a') if title_tag else item.find('a', href=True)
            
            if not link_tag:
                continue
                
            title = link_tag.get_text(strip=True) if link_tag else "Sem título"
            url = link_tag['href'] if link_tag else ""
            
            # Price
            price_tag = item.find('li', class_='item-price') or item.find(class_='item-price')
            price = price_tag.get_text(strip=True) if price_tag else "Preço sob consulta"
            
            if not prop_id and url:
                prop_id = hashlib.md5(url.encode()).hexdigest()

            if prop_id and url:
                properties.append({
                    'id': prop_id,
                    'title': title,
                    'url': url,
                    'price': price,
                    'site': 'franciscofaria'
                })
        except Exception as e:
            print(f"Erro ao processar um item de franciscofaria: {e}")
            
    return properties
