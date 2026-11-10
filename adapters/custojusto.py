from bs4 import BeautifulSoup
import re
import hashlib
from analytics.extractor import BARCELOS_PARISHES, normalize_text

OTHER_CONCELHOS_BRAGA = [
    "braga", "guimaraes", "guimarães", "famalicao", "famalicão",
    "vila nova de famalicao", "vila nova de famalicão", "esposende",
    "vila verde", "amares", "povoa de lanhoso", "póvoa de lanhoso",
    "terras de bouro", "vieira do minho", "cabeceiras de basto",
    "celorico de basto", "fafe", "vizela"
]

def parse_custojusto(html_content):
    """
    Parser for CustoJusto.pt listings.
    Strictly filters out listings that belong to other concelhos (e.g. Braga, Guimarães, Famalicão).
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

            # Title
            h2 = link.find(['h2', 'h3'])
            title = h2.get_text(strip=True) if h2 else (link.get('title') or "Imóvel CustoJusto")

            # Climb parent hierarchy for Card Container, Location, Price and Image
            price = "Preço N/A"
            image_url = None
            location_text = ""
            card_text = ""
            
            parent = link
            for _ in range(8):
                if not parent:
                    break
                p_text = parent.get_text(" ", strip=True)
                if len(p_text) > len(card_text):
                    card_text = p_text
                
                # Check for location in paragraphs/spans (typically formatted as 'Concelho - Freguesia')
                if not location_text:
                    for el in parent.find_all(['p', 'span']):
                        txt = el.get_text(strip=True)
                        if ' - ' in txt or '-' in txt:
                            norm_el = normalize_text(txt)
                            if 'barcelos' in norm_el or any(c in norm_el for c in OTHER_CONCELHOS_BRAGA):
                                location_text = txt
                                break

                if "€" in p_text and price == "Preço N/A":
                    price_match = re.search(r'(\d+[\s.\u00a0]?\d{3})\s*€', p_text)
                    if price_match:
                        price = price_match.group(0).strip()
                
                if not image_url:
                    img = parent.find('img')
                    if img:
                        src = img.get('src') or img.get('data-src') or img.get('data-original')
                        if src and 'data:image' not in src:
                            image_url = src
                parent = parent.parent

            # Location validation: strictly filter out non-Barcelos ads
            norm_loc = normalize_text(location_text)
            norm_card = normalize_text(card_text)
            norm_title = normalize_text(title)
            
            # 1. If explicit location mentions another municipality from Braga district and not Barcelos: reject
            is_other = False
            for other in OTHER_CONCELHOS_BRAGA:
                if norm_loc and re.search(r'\b' + re.escape(other) + r'\b', norm_loc) and "barcelos" not in norm_loc:
                    is_other = True
                    break
            if is_other:
                continue

            # 2. Check if the ad is genuinely in Barcelos
            is_barcelos = False
            if "barcelos" in norm_loc or "barcelos" in norm_title or "barcelos" in norm_card:
                is_barcelos = True
            else:
                # Check known Barcelos parishes in title or card text
                for parish in BARCELOS_PARISHES:
                    p_norm = normalize_text(parish)
                    if re.search(r'\b' + re.escape(p_norm) + r'\b', norm_card) or re.search(r'\b' + re.escape(p_norm) + r'\b', norm_title):
                        is_barcelos = True
                        break

            # If not verified as Barcelos, discard
            if not is_barcelos:
                continue

            seen_ids.add(prop_id)

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
