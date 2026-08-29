import urllib.parse
import re

def extract_image(element, base_url=None):
    """
    Parses a BeautifulSoup element representing a listing card
    to extract the main property image URL.
    Returns None if no suitable image is found.
    """
    if not element:
        return None
        
    imgs = element.find_all('img')
    for img in imgs:
        src = None
        # Look for typical dynamic/lazy-loaded source attributes
        for attr in ['data-src', 'data-lazy-src', 'data-original', 'src', 'data-srcset', 'srcset']:
            val = img.get(attr)
            if val:
                if 'srcset' in attr:
                    # Take the first/primary URL in srcset
                    parts = val.split(',')
                    if parts:
                        src = parts[0].strip().split(' ')[0]
                        break
                else:
                    src = val.strip()
                    break
        
        if not src:
            continue
            
        src_lower = src.lower()
        # Ignore common tracking pixels, icons, logos, etc.
        if any(keyword in src_lower for keyword in [
            'logo', 'avatar', 'icon', 'marker', 'profile', 'spinner', 
            'lazy-loader', 'placeholder', 'transparent', 'pixel', 'heart', 'star', 'check'
        ]):
            continue
            
        # Verify it has an image extension or looks like a dynamic image path
        if not any(ext in src_lower for ext in ['.jpg', '.jpeg', '.png', '.webp', '.gif']) and 'image' not in src_lower:
            continue
            
        # Format/Clean URL
        if src.startswith('//'):
            src = 'https:' + src
        elif src.startswith('/') and base_url:
            src = urllib.parse.urljoin(base_url, src)
        elif not src.startswith('http') and base_url:
            src = urllib.parse.urljoin(base_url, src)
            
        return src
        
    return None


def extract_image_from_dict(data):
    """
    Recursively scans a JSON dictionary looking for potential listing image URLs.
    """
    if not data:
        return None
        
    # Standard keys
    for key in ['photoUrl', 'photo_url', 'imageUrl', 'image_url', 'listingImage', 'mainPhoto', 'thumbnail', 'photo']:
        val = data.get(key) if isinstance(data, dict) else None
        if val and isinstance(val, str) and val.startswith('http'):
            return val
            
    # List keys
    for key in ['photos', 'images', 'photoUrls', 'photosUrls', 'media']:
        val = data.get(key) if isinstance(data, dict) else None
        if isinstance(val, list) and val:
            first = val[0]
            if isinstance(first, str) and first.startswith('http'):
                return first
            if isinstance(first, dict):
                for sub_key in ['url', 'src', 'href', 'path', 'large']:
                    sub_val = first.get(sub_key)
                    if sub_val and isinstance(sub_val, str) and sub_val.startswith('http'):
                        return sub_val
                        
    # Recursive search
    if isinstance(data, dict):
        for k, v in data.items():
            if isinstance(v, str) and v.startswith('http') and any(ext in v.lower() for ext in ['.jpg', '.jpeg', '.webp', '.png']):
                if not any(x in v.lower() for x in ['logo', 'avatar', 'icon', 'profile', 'marker']):
                    return v
            elif isinstance(v, (dict, list)):
                res = extract_image_from_dict(v)
                if res:
                    return res
    elif isinstance(data, list):
        for item in data:
            res = extract_image_from_dict(item)
            if res:
                return res
                
    return None
