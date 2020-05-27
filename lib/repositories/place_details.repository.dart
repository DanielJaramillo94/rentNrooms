import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/place.model.dart';

class PlaceRepository {
  final String url = 'https://reqres.in/api/users';

  Future<Place> fetchRoom() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => Place(
          'https://eu.dlink.com/es/es/-/media/landing-pages/2018/mydlink/smart-home.png?h=519&la=es-ES&w=807',
          'Deluxe Resorts',
          'Medellín, Poblado',
          105,
          'Vivamus efficitur mollis quam at accumsan. This may work :).',
          4.3,
          ['wifi, parking, ac'],
          "idRoom",
          "agency"),
    );
  }

  // ❗ making http calls
  // Future<List<HomeCard>> fetchHomeCards() async {
  //   http.Response response =  await http.get(url);
  //   Map data = json.decode(response.body);
  //   List homeCards = data['data'];
  //   return homeCards.map((obj) {
  //     String imgURL = obj['avatar'];
  //     String location = obj['first_name'];
  //     return HomeCard(imgURL, location);
  //   }).toList();
  // }
}
