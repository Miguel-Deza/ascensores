final Map<String, Map<String, dynamic>> formData = {
  '375': {
    'numeroPersonas': '5',
    'cabina': '900x1200',
    'tipoPuertaOptions': ['C2', 'T2'],
    'puertasData': {
      'C2': {'pasoLibre': '700', 'ducto': '1600x1500'},
      'T2': {'pasoLibre': '800', 'ducto': '1550x1580'}
    }
  },
  '450': {
    'numeroPersonas': '6',
    'cabina': '1000x1250',
    'tipoPuertaOptions': ['T2'],
    'puertasData': {
      'T2': {'pasoLibre': '800', 'ducto': '1600x1630'}
    }
  },
  '630': {
    'numeroPersonas': '8',
    'cabina': '1100x1400',
    'tipoPuertaOptions': ['C2', 'T2'],
    'puertasData': {
      'C2': {'pasoLibre': '700', 'ducto': '1700x1780'},
      'T2': {'pasoLibre': '800', 'ducto': '1700x1780'}
    }
  },
  '800': {
    'numeroPersonas': '10',
    'cabina': '1350x1400',
    'tipoPuertaOptions': ['T2'],
    'puertasData': {
      'T2': {'pasoLibre': '900', 'ducto': '1950x1780'}
    }
  },
  "1000": {
    "numeroPersonas": "13",
    "cabinas": {
      "1100x2100": {
        "tipoPuerta": "T2",
        "pasosLibres": {
          "900": {"ducto": "1650x2480"},
          "1000": {"ducto": "1850x2480"}
        }
      },
      "2100x1100": {
        "tipoPuerta": "C2",
        "pasosLibres": {
          "1000": {"ducto": "2700x1400"},
          "1200": {"ducto": "2700x1400"}
        }
      },
      "1400x1600": {
        "tipoPuerta": "T2",
        "pasosLibres": {
          "1000": {"ducto": "2000x1950"}
        }
      }
    }
  }
};
