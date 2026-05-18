from bs4 import BeautifulSoup
import re
import json
import hashlib

def parse_remax(html_content):
    """
    Parser for Remax.pt listings.
    Strategy:
      1. Try '__NEXT_DATA__' JSON extraction (initialSearchResultsInfo.results)
      2. Fallback to rendered DOM parsing (listing cards)
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # Strategy 1: Extract from __NEXT_DATA__ JSON (Next.js SSR/SSG)
    next_data = soup.find('script', id='__NEXT_DATA__')
    if next_data:
        try:
            data = json.loads(next_data.string)
            page_props = data.get('props', {}).get('pageProps', {})
            
            # The results are nested in initialSearchResultsInfo.results
            search_info = page_props.get('initialSearchResultsInfo', {})
            results = search_info.get('results', [])
            
            if results:
                for item in results:
                    listing_id = str(item.get('listingId', ''))
                    title_parts = []
                    
                    # Build title from available fields
                    listing_type = item.get('listingTypeLabel', '')
                    typology = item.get('typologyLabel', '')
                    region = item.get('regionLabel', '')
                    
                    if listing_type:
                        title_parts.append(listing_type)
                    if typology:
                        title_parts.append(typology)
                    if region:
                        title_parts.append(region)
                    
                    title = ' - '.join(title_parts) if title_parts else item.get('title', 'Remax Property')
                    
                    # URL construction
                    url = item.get('detailUrl', '') or item.get('url', '')
                    if url and not url.startswith('http'):
                        url = "https://www.remax.pt" + url
                    
                    # Price - handle both numeric and string formats
                    price_raw = item.get('price', item.get('priceLabel', 'N/A'))
                    if isinstance(price_raw, (int, float)):
                        price = f"{int(price_raw):,} €".replace(',', '.')
                    else:
                        price = str(price_raw)
                    
                    if listing_id or url:
                        properties.append({
                            'id': listing_id or hashlib.md5(url.encode()).hexdigest(),
                            'title': title,
                            'url': url,
                            'price': price,
                            'site': 'remax'
                        })
                
                if properties:
                    return properties
        except Exception:
            pass

    # Strategy 2: Parse rendered DOM (client-side rendered content)
    # RE/MAX uses various card structures depending on version
    listings = soup.find_all('div', attrs={'data-testid': re.compile(r'listing', re.I)})
    
    if not listings:
        # Try broader selectors for rendered listing cards
        listings = soup.find_all('div', class_=re.compile(r'listing-card|ListingCard|result-card|property-card', re.I))
    
    if not listings:
        # Try finding links to property detail pages
        property_links = soup.find_all('a', href=re.compile(r'/imoveis/venda[^"]*?/\d+-\d+', re.I))
        for link in property_links:
            try:
                url = link['href']
                if not url.startswith('http'):
                    url = "https://www.remax.pt" + url

                # Extract ID from URL (e.g., 125681105-29)
                id_match = re.search(r'/(\d+-\d+)$', url)
                prop_id = id_match.group(1) if id_match else hashlib.md5(url.encode()).hexdigest()

                # Avoid duplicates
                if any(p['id'] == prop_id for p in properties):
                    continue

                # Extract title from URL slug (more reliable than DOM text)
                # URL: /pt/imoveis/venda-apartamento-t3-barcelos-martim/125681105-29
                slug_match = re.search(r'/imoveis/([\w-]+)/\d+-\d+$', url)
                if slug_match:
                    slug = slug_match.group(1)
                    # Remove 'venda-' or 'comprar-' prefix
                    slug = re.sub(r'^(venda|comprar)-', '', slug)
                    # Convert hyphens to spaces, capitalize each word
                    title = slug.replace('-', ' ').title()
                    # Make it more readable: "Apartamento T3 Barcelos Martim"
                    title = re.sub(r'\bT(\d)', r'T\1', title)  # Keep T2, T3 etc uppercase
                else:
                    title = link.get('title', 'Remax Property')
                    if not title or len(title) < 5:
                        title = 'Remax Property'

                # Extract price - walk up the DOM to find container with price
                # Remax prices use spaces/non-breaking spaces: "240 000 €"
                price = "N/A"
                parent = link.parent
                for _ in range(6):  # Walk up max 6 levels
                    if parent is None:
                        break
                    parent_text = parent.get_text()
                    # Match prices like "240 000 €" or "207.000 €" or "240,000 €"
                    price_match = re.search(r'([\d]+[\s.\u00a0]?[\d]{3}[\s.\u00a0]?[\d]*)\s*€', parent_text)
                    if price_match:
                        price = price_match.group(0).strip()
                        break
                    # Also try "Preço sob Consulta"
                    if 'consulta' in parent_text.lower():
                        price = "Preço sob Consulta"
                        break
                    parent = parent.parent

                properties.append({
                    'id': prop_id,
                    'title': title,
                    'url': url,
                    'price': price,
                    'site': 'remax'
                })
            except Exception:
                continue

    # Strategy 2b: Parse standard card structure
    for item in listings:
        try:
            link_tag = item.find('a', href=True)
            if not link_tag:
                continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.remax.pt" + url
            
            title_tag = item.find(['h2', 'h3', 'h4'])
            title = title_tag.get_text(strip=True) if title_tag else "Remax Property"
            
            price_tag = item.find(string=re.compile(r'[\d.,]+\s*€', re.I))
            price = price_tag.parent.get_text(strip=True) if price_tag and price_tag.parent else "N/A"
            
            prop_id = re.search(r'/(\d+-\d+)', url)
            prop_id = prop_id.group(1) if prop_id else hashlib.md5(url.encode()).hexdigest()

            if any(p['id'] == prop_id for p in properties):
                continue

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'remax'
            })
        except Exception:
            continue
            
    return properties
