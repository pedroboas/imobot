from bs4 import BeautifulSoup
import re
import hashlib

def parse_iadportugal(html_content):
    """
    Parser for iadportugal.pt listings.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Target property listing links
    links = soup.find_all('a', href=re.compile(r'/anuncio/.*?/(r\d+)', re.I))
    
    seen_ids = set()
    for link in links:
        try:
            url = link.get('href', '')
            if not url:
                continue
                
            match = re.search(r'/(r\d+)(?:[/?#]|$)', url)
            prop_id = match.group(1) if match else hashlib.md5(url.encode()).hexdigest()
            
            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)
            
            if not url.startswith('http'):
                url = "https://www.iadportugal.pt" + url

            # Find parent card for price and title
            card = link
            for _ in range(6):
                if not card: break
                card_text = card.get_text(" | ", strip=True)
                if "€" in card_text:
                    break
                card = card.parent

            card_text = card.get_text(" | ", strip=True) if card else ""
            price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', card_text)
            if price_match:
                price = price_match.group(0).strip()
            else:
                price = "Preço N/A"

            # Title
            title = link.get('title') or ""
            if not title:
                slug_match = re.search(r'/anuncio/([^/]+)/', url)
                if slug_match:
                    slug = slug_match.group(1)
                    title = slug.replace('-', ' ').title()
                else:
                    title = "Imóvel iad Portugal"

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'iadportugal'
            })
        except Exception:
            continue
            
    return properties
