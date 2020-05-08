import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/search_card.model.dart';

class SearchCardRepository {

  final String url = 'https://reqres.in/api/users';

  Future<List<SearchCard>> fetchSearchCards() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => [
          SearchCard('assets/images/apartment1.jpg', 'Poblado, Medellín', '4.3', 'Apartamento en El poblado', '350000.0'),
          SearchCard('assets/images/apartment2.jpg', 'Bronkx, Bogotá', '4.8', 'Torres de bombona', '80000.0'),
          SearchCard('assets/images/apartment3.jpg', 'El Raudal, Medellín', '5.0', 'Apartamento en el Estadio', '340000.0'),
        ]
    );
  }
}