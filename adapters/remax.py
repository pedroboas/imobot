from bs4 import BeautifulSoup
import re
import json

def parse_remax(html_content):
    """
    Parser for Remax.pt listings.
    Supports both traditional HTML scraping and JSON extraction from '__NEXT_DATA__' blocks
    for enhanced reliability on dynamic pages.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    properties = []
    
    # RE/MAX uses a lot of different classes. Let's look for common ones in 2024/2025
    listings = soup.find_all(['div', 'article'], class_=re.compile(r'listing-item|gallery-item|result-card|card', re.I))
    
    # If no results, try looking for the __NEXT_DATA__ script which contains the JSON state
    next_data = soup.find('script', id='__NEXT_DATA__')
    if next_data:
        try:
            data = json.loads(next_data.string)
            # Try to navigate the JSON to find results
            if 'props' in data and 'pageProps' in data['props'] and 'results' in data['props']['pageProps']:
                results = data['props']['pageProps']['results']
                for item in results:
                    prop_id = str(item.get('listingId', ''))
                    title = item.get('title', 'Remax Property')
                    url = item.get('url', '')
                    if url and not url.startswith('http'):
                        url = "https://www.remax.pt" + url
                    price = item.get('price', 'N/A')
                    
                    properties.append({
                        'id': prop_id or str(hash(url)),
                        'title': title,
                        'url': url,
                        'price': price,
                        'site': 'remax'
                    })
                return properties
        except:
            pass

    # Fallback to HTML parsing if JSON fails or is missing
    for item in listings:
        try:
            link_tag = item.find('a', href=True)
            if not link_tag: continue
            
            url = link_tag['href']
            if url and not url.startswith('http'):
                url = "https://www.remax.pt" + url
            
            title_tag = item.find(['h2', 'h3', 'h4'])
            title = title_tag.get_text(strip=True) if title_tag else "Remax Property"
            
            price_tag = item.find(string=re.compile(r'€|\d+[\.,]\d+', re.I))
            price = price_tag.parent.get_text(strip=True) if price_tag and price_tag.parent else "N/A"
            
            prop_id = re.search(r'/(\d+-\d+)', url)
            prop_id = prop_id.group(1) if prop_id else str(hash(url))

            properties.append({
                'id': prop_id,
                'title': title,
                'url': url,
                'price': price,
                'site': 'remax'
            })
        except:
            continue
            
    return properties
