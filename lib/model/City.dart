class CitiesList {
  final List<City> cities;

  CitiesList({
    this.cities,
  });

  factory CitiesList.fromJson(List<dynamic> parsedJson) {

    List<City> photos = new List<City>();
    photos = parsedJson.map(
            (i)=>City.fromJson(i)
      ).toList();

    return new CitiesList(
        cities: photos
    );
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