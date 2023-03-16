
String? carNameParser(String? prevname){
  Map<String, String> parser = {
    "MG Motors": "MG",
    "Maruti Suzuki": "Suzuki",
    "Volkswagen": "VK"
  };
  if(parser[prevname] != null){
    return parser[prevname];
  } else {
    return prevname;
  }


}