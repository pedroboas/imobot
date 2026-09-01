from bs4 import BeautifulSoup
import re
import hashlib

def parse_iadportugal(html_content):
    """
    Parser for iadportugal.pt listings.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    articles = soup.find_all('article')
    
    seen_ids = set()
    for article in articles:
        try:
            link = article.find('a', href=re.compile(r'/anuncio/.*?/(r\d+)', re.I))
            if not link:
                continue
                
            url = link.get('href', '')
            if not url: continue
            if not url.startswith('http'):
                url = "https://www.iadportugal.pt" + url

            match = re.search(r'/(r\d+)(?:[/?#]|$)', url)
            prop_id = match.group(1) if match else hashlib.md5(url.encode()).hexdigest()
            
            if prop_id in seen_ids: continue
            seen_ids.add(prop_id)

            # Title
            h2 = article.find('h2')
            if h2:
                title = h2.get_text(" ", strip=True)
            else:
                title = link.get('title') or "Imóvel iad Portugal"

            # Price
            price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', article.get_text())
            price = price_match.group(0).strip() if price_match else "Preço N/A"

            # Image
            img = article.find('img')
            image_url = img.get('src') if img else None
            if image_url and 'width=300' in image_url:
                image_url = image_url.replace('width=300', 'width=800')

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'iadportugal',
                'image_url': image_url
            })
        except Exception:
            continue
            
    return properties
