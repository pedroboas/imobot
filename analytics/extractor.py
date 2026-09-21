"""
Property Attributes & Features Extractor
-----------------------------------------
Extracts structured real estate features (typology, parish, area, price, condition,
garage, elevator) from unstructured property titles and descriptions.
"""

import re
import unicodedata

# All major parishes / União de Freguesias of Barcelos
BARCELOS_PARISHES = [
    # City Center & Immediate Surroundings
    "Arcozelo", "Barcelinhos", "Barcelos", "Vila Boa", "Vila Frescaínha", "Vila Frescainha",
    "São Martinho de Vila Frescaínha", "São Pedro de Vila Frescaínha",
    "Galegos Santa Maria", "Galegos São Martinho", "Galegos",
    "Silva", "Alvelos", "Manhente", "Lijó", "Rio Covo Santa Eulália", "Rio Covo Santa Eugénia", "Rio Covo",
    "Tamel São Veríssimo", "Tamel Santa Leocádia", "Tamel São Pedro Fins", "São Veríssimo", "Tamel",
    "Abade de Neiva", "Aborim", "Adães", "Airó", "Aldreu", "Alheira", "Igreja Nova",
    "Alvito São Martinho", "Alvito São Pedro", "Alvito",
    "Areias", "Areias de Vilar", "Balugães", "Campo", "Carapeços", "Carvalhal", "Carvalhas",
    "Cossourado", "Creixomil", "Cristelo", "Durrães", "Fornelos", "Fragoso", "Gamil", "Midões",
    "Gilmonde", "Lama", "Macieira de Rates", "Martim", "Milhazes", "Faria", "Vilar de Figos",
    "Moure", "Oliveira", "Palme", "Panóias", "Paradela", "Pereira", "Perelhal", "Pousa",
    "Quintiães", "Aguiar", "Remelhe", "Roriz", "Sequeade", "Bastuço", "Silveiros", "Tregosa",
    "Ucha", "Viatodos", "Grimancelos", "Minhotães", "Monte de Fralães", "Vila Cova", "Feitos",
    "Vila Seca", "Carreira", "Fonte Coberta", "Mariz", "Pedra Furada", "Várzea"
]

def normalize_text(text):
    if not text:
        return ""
    text = unicodedata.normalize('NFKD', str(text))
    text = "".join(c for c in text if not unicodedata.combining(c))
    return text.lower().strip()

NORMALIZED_PARISHES = [(p, normalize_text(p)) for p in sorted(BARCELOS_PARISHES, key=len, reverse=True)]


def extract_numeric_price(price_str):
    """
    Converts formatted price strings like '250.000 €', '185 000€', '230000€' to integer 250000.
    """
    if not price_str:
        return None
    try:
        clean = re.sub(r'[^\d]', '', str(price_str))
        if clean:
            val = int(clean)
            if 10000 <= val <= 20000000:
                return val
    except Exception:
        pass
    return None


def extract_typology(text):
    """
    Extracts typology: T0, T1, T2, T3, T4, T5, etc.
    """
    if not text:
        return None
    
    match = re.search(r'\b[tT](\d)(?:\+\d)?\b', str(text))
    if match:
        num = int(match.group(1))
        return f"T{num}"
    
    match_quarto = re.search(r'\b(\d)\s*(?:quartos?|dormit[oó]rios?|assoadas?)\b', str(text), re.I)
    if match_quarto:
        num = int(match_quarto.group(1))
        return f"T{num}"
        
    return None


def extract_property_type(text):
    """
    Classifies property type: 'Apartamento', 'Moradia', 'Terreno', 'Outro'.
    """
    if not text:
        return "Apartamento"
    
    norm = normalize_text(text)
    if any(k in norm for k in ["moradia", "casa", "vivenda", "villa", "quinta", "solar", "chalet"]):
        return "Moradia"
    if any(k in norm for k in ["apartamento", "duplex", "estudio", "loft", "andar moradia", "andar de moradia", "fracao"]):
        return "Apartamento"
    if any(k in norm for k in ["terreno", "lote", "parcela"]):
        return "Terreno"
        
    return "Apartamento"


def extract_parish(text):
    """
    Identifies the Barcelos parish/freguesia from text.
    """
    if not text:
        return "Barcelos (Geral)"
        
    norm = normalize_text(text)
    
    for original, normalized in NORMALIZED_PARISHES:
        pattern = r'\b' + re.escape(normalized) + r'\b'
        if re.search(pattern, norm):
            if "frescainha" in normalized:
                return "Vila Frescaínha"
            if "galegos" in normalized:
                return "Galegos"
            if "tamel" in normalized:
                return "Tamel"
            if "rio covo" in normalized:
                return "Rio Covo"
            return original
            
    if "barcelos" in norm:
        return "Barcelos Centro"
        
    return "Barcelos (Geral)"


def extract_area_m2(text):
    """
    Extracts square meters (m²) from text.
    """
    if not text:
        return None
        
    match = re.search(r'(\d{2,4}(?:[.,]\d{1,2})?)\s*(?:m2|m²|sqm|metros\s*quadrados)', str(text), re.I)
    if match:
        try:
            val = float(match.group(1).replace(',', '.'))
            if 15 <= val <= 3000:
                return int(round(val))
        except Exception:
            pass
    return None


def extract_condition(text):
    """
    Identifies condition: 'Novo', 'Restauro', or 'Usado'.
    """
    if not text:
        return "Usado"
        
    norm = normalize_text(text)
    if any(k in norm for k in ["novo", "nova", "construcao", "a estrear", "chave na mao", "projeto aprovado"]):
        return "Novo"
    if any(k in norm for k in ["restauro", "recuperar", "ruina", "remodelacao", "para obras", "reconstrucao"]):
        return "Restauro"
        
    return "Usado"


def extract_features(text):
    """
    Detects boolean features: garage and elevator.
    """
    has_garage = False
    has_elevator = False
    
    if text:
        norm = normalize_text(text)
        if any(k in norm for k in ["garagem", "box", "lugar de garagem", "estacionamento", "parqueamento"]):
            has_garage = True
        if any(k in norm for k in ["elevador", "ascensor"]):
            has_elevator = True
            
    return has_garage, has_elevator


def enrich_property(prop_dict):
    """
    Takes a raw property dictionary and enriches it with structured analytics fields.
    """
    title = prop_dict.get('title', '')
    url = prop_dict.get('url', '')
    price_str = prop_dict.get('price', '')
    combined_text = f"{title} {url}"

    num_price = extract_numeric_price(price_str)
    typology = extract_typology(combined_text) or "T2"
    prop_type = extract_property_type(combined_text)
    parish = extract_parish(combined_text)
    area = extract_area_m2(combined_text)
    condition = extract_condition(combined_text)
    has_garage, has_elevator = extract_features(combined_text)

    price_per_m2 = None
    if num_price and area and area > 10:
        price_per_m2 = round(num_price / area, 2)

    return {
        **prop_dict,
        "numeric_price": num_price,
        "typology": typology,
        "property_type": prop_type,
        "parish": parish,
        "area_m2": area,
        "price_per_m2": price_per_m2,
        "condition": condition,
        "has_garage": has_garage,
        "has_elevator": has_elevator
    }
