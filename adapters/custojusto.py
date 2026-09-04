from bs4 import BeautifulSoup
import re
import hashlib

def parse_custojusto(html_content):
    """
    Parser for CustoJusto.pt listings.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Target all property links with ID at end
    links = soup.find_all('a', href=re.compile(r'/braga/imobiliario/.*?-\d{6,}', re.I))
    seen_ids = set()
    
    for link in links:
        try:
            url = link.get('href', '')
            if not url:
                continue
            if not url.startswith('http'):
                url = "https://www.custojusto.pt" + url

            id_match = re.search(r'-(\d{6,})(?:[/?#]|$)', url)
            prop_id = id_match.group(1) if id_match else url
            
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            # Title
            h2 = link.find(['h2', 'h3'])
            title = h2.get_text(strip=True) if h2 else (link.get('title') or "Imóvel CustoJusto")

            # Climb parent hierarchy for Price and Image
            price = "Preço N/A"
            image_url = None
            parent = link
            for _ in range(8):
                if not parent:
                    break
                parent_text = parent.get_text(" ", strip=True)
                if "€" in parent_text and price == "Preço N/A":
                    price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', parent_text)
                    if price_match:
                        price = price_match.group(0).strip()
                
                if not image_url:
                    img = parent.find('img')
                    if img:
                        src = img.get('src') or img.get('data-src') or img.get('data-original')
                        if src and 'data:image' not in src:
                            image_url = src
                parent = parent.parent

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'custojusto',
                'image_url': image_url
            })
        except Exception:
            continue
            
    return properties
