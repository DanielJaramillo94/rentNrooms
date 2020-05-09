import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/city.model.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:rent_n_rooms/providers/city.provider.dart';

class DataSearch extends SearchDelegate<String> {
  CitiesList cities;

  final citiesSearch = [
    'Bogotá',
    'Medellín',
    'Cali',
    'Barranquilla',
    'Cartagena',
    'Cúcuta',
    'Soledad',
    'Ibagué'
  ];
  final popularCities = ['Bogotá', 'Medellín', 'Cali', 'Cartagena'];

  Future<String> _loadCityAsset() async {
    return await rootBundle.loadString('assets/json/cities.json');
  }

  Future loadCities() async {
    String jsonCities = await _loadCityAsset();
    final jsonResponse = json.decode(jsonCities);
    CitiesList citiesList = CitiesList.fromJson(jsonResponse);
    this.cities = citiesList;
  }

  @override
  Widget buildResults(BuildContext context) {    
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var cityProvider = Provider.of<CityProvider>(context, listen: false);

    loadCities();
    final suggestionList = query.isEmpty
        ? popularCities
        : citiesSearch
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
          String code = '0';
          if (cities != null) {
            code = cities.searchCodeCity(query);
          }
          cityProvider.citySelected = City(
            nameCity: query,
            codeCity: code,
          );

          Navigator.of(context).pushNamed('/date');
        },
        leading: Icon(Icons.location_on),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  fontFamily: 'Cocogoose',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }
}
