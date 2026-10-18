from bs4 import BeautifulSoup
import re
import hashlib
from adapters.utils import extract_image

def parse_imovirtual(html_content):
    """
    Parser for Imovirtual.com listings.
    Identifies 'article' tags with 'data-testid="listing-item"' and extracts ID, title, URL, and price.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    seen_ids = set()
    
    # Imovirtual listings are usually in 'article' tags with data-testid="listing-item"
    # New structure uses data-sentry-component="AdvertCard" or data-testid="listing-ad"
    listings = soup.find_all('article', {'data-sentry-component': 'AdvertCard'}) or \
               soup.find_all('article', {'data-testid': 'listing-ad'}) or \
               soup.find_all('article', {'data-testid': 'listing-item'})
    
    for item in listings:
        try:
            title_tag = item.find('p', {'data-cy': 'listing-item-title'}) or \
                        item.find('span', {'data-cy': 'listing-item-title'}) or \
                        item.find('h3')

            # Resolve the actual listing link (strictly ignoring /hpr/ anti-scraper honeypot links)
            link_tag = None
            if title_tag:
                parent_a = title_tag.find_parent('a', href=True)
                if parent_a and '/hpr/' not in parent_a['href'].lower():
                    link_tag = parent_a

            if not link_tag:
                for a_tag in item.find_all('a', href=True):
                    href_lower = a_tag['href'].lower()
                    if '/hpr/' in href_lower:
                        continue
                    if a_tag.get('data-cy') == 'listing-item-link' or '/pt/anuncio/' in href_lower or '/pt/empreendimento/' in href_lower:
                        link_tag = a_tag
                        break

            if not link_tag:
                continue

            url = link_tag['href'].split('?')[0].strip()
            if '/hpr/' in url.lower():
                continue
            if url and not url.startswith('http'):
                url = "https://www.imovirtual.com" + url

            if not title_tag:
                title_tag = link_tag
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

            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            # Image
            image_url = extract_image(item, "https://www.imovirtual.com")

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'imovirtual',
                'image_url': image_url
            })
        except Exception as e:
            print(f"Erro ao processar um item de Imovirtual: {e}")
            
    return properties
