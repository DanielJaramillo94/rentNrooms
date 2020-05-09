import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:rent_n_rooms/models/city.model.dart';

Future<String> _loadCityAsset() async {
  return await rootBundle.loadString('assets/json/cities.json');
}

Future loadCities() async {
  String jsonCities = await _loadCityAsset();
  final jsonResponse = json.decode(jsonCities);
  CitiesList citiesList = CitiesList.fromJson(jsonResponse);
  print("Ciudad " + citiesList.cities[0].nameCity);
}
