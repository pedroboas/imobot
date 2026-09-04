from bs4 import BeautifulSoup
import re
import hashlib
import json

def parse_century21(html_content, api_data=None):
    """
    Parser for Century 21 Portugal listings.
    Supports intercepted API json and DOM fallback.
    """
    properties = []
    
    # Strategy 1: Direct intercepted API JSON
    if api_data:
        try:
            if isinstance(api_data, str):
                data = json.loads(api_data)
            else:
                data = api_data
                
            items = data.get('properties', []) or data.get('results', [])
            for item in items:
                ref = item.get('reference') or str(item.get('id', ''))
                title = item.get('title') or item.get('name') or "Imóvel Century 21"
                price_val = item.get('price')
                if price_val:
                    try:
                        price = f"{int(float(price_val)):,} €".replace(',', '.')
                    except Exception:
                        price = f"{price_val} €"
                else:
                    price = "Preço N/A"
                    
                url = f"https://www.century21.pt/comprar/{ref}" if ref else ""
                img_obj = item.get('main_image')
                image_url = img_obj.get('url') if isinstance(img_obj, dict) else (img_obj if isinstance(img_obj, str) else None)
                
                if ref and url:
                    properties.append({
                        'id': ref,
                        'title': title,
                        'url': url,
                        'price': price,
                        'site': 'century21',
                        'image_url': image_url
                    })
            if properties:
                return properties
        except Exception:
            pass

    # Strategy 2: DOM parsing fallback
    soup = BeautifulSoup(html_content, 'html.parser')
    links = soup.find_all('a', href=re.compile(r'/comprar/C\d+', re.I))
    seen_ids = set()
    
    for link in links:
        try:
            url = link.get('href', '')
            if not url:
                continue
            if not url.startswith('http'):
                url = "https://www.century21.pt" + url

            match = re.search(r'/comprar/(C\d+-\d+)', url, re.I)
            prop_id = match.group(1) if match else hashlib.md5(url.encode()).hexdigest()
            
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            parent = link
            price = "Preço N/A"
            image_url = None
            title = "Imóvel Century 21"

            for _ in range(6):
                if not parent:
                    break
                text = parent.get_text(" ", strip=True)
                if "€" in text and price == "Preço N/A":
                    p_match = re.search(r'(\d+[\s. ]?\d{3})\s*€', text)
                    if p_match:
                        price = p_match.group(0).strip()
                
                h2 = parent.find(['h2', 'h3'])
                if h2 and title == "Imóvel Century 21":
                    title = h2.get_text(strip=True)
                    
                if not image_url:
                    img = parent.find('img')
                    if img:
                        src = img.get('src') or img.get('data-src')
                        if src and 'data:image' not in src:
                            image_url = src
                parent = parent.parent

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'century21',
                'image_url': image_url
            })
        except Exception:
            continue
            
    return properties
