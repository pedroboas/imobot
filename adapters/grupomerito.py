from bs4 import BeautifulSoup
import re
import hashlib

def parse_grupomerito(html_content):
    """
    Parser for grupomerito.pt listings.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    cards = soup.find_all('div', class_=re.compile(r'item\b', re.I))
    if not cards:
        cards = soup.find_all('div', class_=re.compile(r'col-', re.I))
        
    seen_ids = set()
    for card in cards:
        try:
            h3 = card.find('h3')
            a_tag = h3.find('a') if h3 else card.find('a', href=re.compile(r'/Imovel/|/imovel/', re.I))
            if not a_tag:
                continue
                
            url = a_tag.get('href', '')
            if not url or '/Imoveis/' in url:
                continue
            if not url.startswith('http'):
                url = "https://www.grupomerito.pt" + url

            prop_id = card.get('data-idproperty')
            if not prop_id:
                id_match = re.search(r'/(\d+)(?:[/?#]|$)', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()

            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            # Clean title
            title = a_tag.get_text(strip=True) if a_tag else "Imóvel Grupo Mérito"
            
            # Location
            location = ""
            if h3 and h3.find('small'):
                location = h3.find('small').get_text(strip=True)
                
            if location and location not in title:
                full_title = f"{title} — {location}"
            else:
                full_title = title

            # Price
            price_box = card.find('div', class_='price')
            if price_box and price_box.find('span'):
                price = price_box.find('span').get_text(strip=True)
            else:
                price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', card.get_text())
                price = price_match.group(0).strip() if price_match else "Preço N/A"

            # Image
            img_tag = card.find('div', class_='image')
            img = img_tag.find('img') if img_tag else card.find('img')
            image_url = None
            if img:
                src = img.get('src') or img.get('data-src')
                if src:
                    image_url = src.replace('_s.jpg', '_m.jpg')

            properties.append({
                'id': str(prop_id),
                'title': full_title,
                'url': url,
                'price': price,
                'site': 'grupomerito',
                'image_url': image_url,
                'location': location
            })
        except Exception:
            continue
            
    return properties
