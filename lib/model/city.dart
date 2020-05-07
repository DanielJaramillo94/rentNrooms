class CitiesList {
  final List<City> cities;

  CitiesList({
    this.cities,
  });

  factory CitiesList.fromJson(List<dynamic> parsedJson) {

    List<City> cities = new List<City>();
    cities = parsedJson.map(
            (i)=>City.fromJson(i)
      ).toList();

    return new CitiesList(
        cities: cities
    );
  }

  String searchCodeCity(String nameCity){
    for(City city in cities){
      if(nameCity == city.nameCity){
        return city.codeCity;
      }
    }
    return '0';
  }

}

class City{
  final String nameCity;
  final String codeCity;

  City({
    this.nameCity,
    this.codeCity
  }) ;

  factory City.fromJson(Map<String, dynamic> json){
    return new City(
      nameCity: json['city'].toString(),
      codeCity: json['code'],
    );
  }

}