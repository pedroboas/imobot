from bs4 import BeautifulSoup
import re
import json
import hashlib
from adapters.utils import extract_image, extract_image_from_dict

def _extract_from_api_results(results):
    properties = []
    for item in results:
        listing_id = str(item.get('listingTitle', '') or item.get('listingId', '') or item.get('id', ''))
        tags = item.get('descriptionTags', '')
        
        if tags:
            title = tags.replace('-', ' ').title()
            title = re.sub(r'\bT(\d)', r'T\1', title)
        else:
            title = f"Imóvel RE/MAX {listing_id}"
        
        if tags and listing_id:
            url = f"https://www.remax.pt/pt/imoveis/{tags}/{listing_id}"
        elif tags:
            url = f"https://www.remax.pt/pt/imoveis/{tags}"
        else:
            url = item.get('detailUrl', '') or item.get('url', '')
            if url and not url.startswith('http'):
                url = "https://www.remax.pt" + url

        price_val = item.get('listingPrice') or item.get('price')
        if price_val:
            try:
                price = f"{int(float(price_val)):,} €".replace(',', '.')
            except (ValueError, TypeError):
                price = str(price_val)
        else:
            price = "Preço sob Consulta"
        
        prop_id = listing_id or (hashlib.md5(url.encode()).hexdigest() if url else "")
        
        # Image
        image_url = extract_image_from_dict(item)

        if prop_id and url:
            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'remax',
                'image_url': image_url
            })
    return properties

def parse_remax(html_content, api_data=None):
    """
    Parser for Remax.pt listings.
    Strategy 0: Direct intercepted API data (dict or JSON string)
    Strategy 1: Injected __REMAX_API_DATA__ in HTML
    Strategy 2: __NEXT_DATA__ JSON extraction
    Strategy 3: Rendered DOM parsing fallback
    """
    properties = []
    
    # Strategy 0: Direct intercepted API data
    if api_data:
        try:
            if isinstance(api_data, str):
                parsed = json.loads(api_data)
            elif isinstance(api_data, dict):
                parsed = api_data
            else:
                parsed = {}
            
            results = parsed.get('results', [])
            if results:
                props = _extract_from_api_results(results)
                if props:
                    return props
        except Exception as e:
            print("Direct API parsing failed:", e)

    soup = BeautifulSoup(html_content, 'html.parser')
    
    # Strategy 1: Extract from intercepted API data (injected into DOM)
    api_script = soup.find('script', id='__REMAX_API_DATA__')
    if api_script and api_script.string:
        try:
            data = json.loads(api_script.string)
            results = data.get('results', [])
            if results:
                props = _extract_from_api_results(results)
                if props:
                    return props
        except Exception as e:
            print("API Strategy failed:", e)

    # Strategy 2: Extract from __NEXT_DATA__ JSON (Next.js SSR/SSG)
    next_data = soup.find('script', id='__NEXT_DATA__')
    if next_data and next_data.string:
        try:
            data = json.loads(next_data.string)
            page_props = data.get('props', {}).get('pageProps', {})
            search_info = page_props.get('initialSearchResultsInfo', {})
            results = search_info.get('results', [])
            
            if results:
                props = _extract_from_api_results(results)
                if props:
                    return props
        except Exception:
            pass

    # Strategy 3: Parse rendered DOM (client-side rendered content)
    cards = soup.find_all('div', attrs={'data-id': re.compile(r'listing-card', re.I)})
    if not cards:
        cards = soup.find_all('a', href=re.compile(r'/(?:pt/)?imoveis/.*?\d+-\d+', re.I))
    
    seen_ids = set()
    for card in cards:
        try:
            link = card if card.name == 'a' else card.find('a', href=True)
            if not link:
                continue
                
            url = link.get('href', '')
            if not url or 'comprar/imoveis' in url:
                continue
            if not url.startswith('http'):
                url = "https://www.remax.pt" + url

            prop_id = link.get('itemid') or card.get('itemid')
            if not prop_id:
                id_match = re.search(r'/(\d+-\d+)(?:[/?#]|$)', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()

            if prop_id in seen_ids:
                continue
            seen_ids.add(prop_id)

            slug_match = re.search(r'/imoveis/([\w-]+)/\d+-\d+', url)
            if slug_match:
                slug = slug_match.group(1)
                slug = re.sub(r'^(venda|comprar)-', '', slug)
                title = slug.replace('-', ' ').title()
                title = re.sub(r'\bT(\d)', r'T\1', title)
            else:
                title = link.get('title', 'Remax Property') or 'Remax Property'

            card_text = card.get_text(separator=" ", strip=True)
            price_match = re.search(r'(\d+[\s.\u00a0]\d{3}(?:[\s.\u00a0]\d+)?)\s*€', card_text)
            if price_match:
                price = price_match.group(0).strip()
            elif 'consulta' in card_text.lower():
                price = "Preço sob Consulta"
            else:
                price = "N/A"

            # Image
            image_url = extract_image(card, "https://www.remax.pt")

            properties.append({
                'id': str(prop_id),
                'title': title,
                'url': url,
                'price': price,
                'site': 'remax',
                'image_url': image_url
            })
        except Exception:
            continue
            
    return properties

