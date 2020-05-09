import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/place.model.dart';

class PlaceRepository {
  final String url = 'https://reqres.in/api/users';

  Future<Place> fetchPlace() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => Place(
          'assets/images/apartment2.jpg',
          'Deluxe Resorts',
          'Medellín, Poblado',
          105,
          'Vivamus efficitur mollis quam at accumsan. Aliquam lacus nisl, ornare et quam ac, interdum aliquet lectus. Proin semper fringilla cursus. Phasellus a risus sit amet quam laoreet cursus. Etiam consectetur dictum leo, sed pharetra felis sodales a. Integer pellentesque neque sed justo gravida, at ullamcorper libero convallis. Maecenas luctus venenatis.',
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
