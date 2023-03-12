
String? oilNameParser(String prevname){
  Map<String, String> parser = {
    "gasoline_95": "Bensin 95",
    "gasohol_95": "Gasohol 95",
    "gasohol_91": "Gasohol 91",
    "gasohol_e20": "Gasohol E20",
    "gasohol_e85": "Gasohol E85",
    "diesel": "Diesel",
    "diesel_b7": "Diesel B7",
    "diesel_b20": "Diesel B20",
    "premium_diesel": "Premium Diesel",
    "ngv": "NGV",
    "vpower_gasohol_95": "V-Power Gasohol 95",
    "vpower_diesel": "V-Power Diesel",
    "vpower_diesel_b7": "V-Power Diesel B7"
  };
  return parser[prevname];


}