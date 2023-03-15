
String? carNameParser(String prevname){
  Map<String, String> parser = {
    "MG Motors": "MG",
    "Maruti Suzuki": "Suzuki"
  };
  if(parser[prevname] != null){
    return parser[prevname];
  } else {
    return prevname;
  }


}