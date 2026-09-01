from bs4 import BeautifulSoup
import re
import hashlib

def parse_grupomerito(html_content):
    """
    Parser for grupomerito.pt listings.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Listings are wrapped in div.item containers or contain links to /Imovel/
    cards = soup.find_all('div', class_=re.compile(r'item\b', re.I))
    if not cards:
        cards = soup.find_all('div', class_=re.compile(r'col-', re.I))
        
    seen_ids = set()
    for card in cards:
        try:
            link = card.find('a', href=re.compile(r'/Imovel/|/imovel/', re.I))
            if not link:
                continue
                
            url = link.get('href', '')
            if not url or '/Imoveis/' in url:
                continue
            if not url.startswith('http'):
                url = "https://www.grupomerito.pt" + url

            # ID extraction from URL (e.g., .../1263687)
            id_match = re.search(r'/(\d+)(?:[/?#]|$)', url)
            prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()

            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            # Title
            title_tag = card.find(['h2', 'h3', 'h4', 'h5', 'p'], class_=re.compile(r'title|titulo|name', re.I))
            if title_tag:
                title = title_tag.get_text(strip=True)
            else:
                card_lines = [line.strip() for line in card.get_text(separator="\n").split("\n") if line.strip()]
                candidates = [l for l in card_lines if len(l) > 10 and not any(k in l.lower() for k in ['detalhes', 'compra', 'arrendar', '€', 'contacto'])]
                title = candidates[0] if candidates else "Imóvel Grupo Mérito"

            # Price
            card_text = card.get_text(separator=" ", strip=True)
            price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', card_text)
            if price_match:
                price = price_match.group(0).strip()
            elif 'consulta' in card_text.lower():
                price = "Preço sob Consulta"
            else:
                price = "Preço N/A"

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'grupomerito'
            })
        except Exception:
            continue
            
    return properties
