import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:rent_n_rooms/model/City.dart';

Future<String> _loadCityAsset() async {
  return await rootBundle.loadString('assets/json/cities.json');
}

Future loadCities() async {
  String jsonCities = await _loadCityAsset();
  final jsonResponse = json.decode(jsonCities);
  CitiesList citiesList = CitiesList.fromJson(jsonResponse);
  print("photos " + citiesList.cities[0].nameCity);
}