import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/home_card.model.dart';

class HomeCardRepository {

  final String url = 'https://reqres.in/api/users';
  
  Future<List<HomeCard>> fetchHomeCards() async {
    http.Response response =  await http.get(url);
    Map data = json.decode(response.body);
    List homeCards = data['data'];
    return homeCards.map((obj) {
      String imgURL = obj['avatar'];
      String location = obj['first_name'];
      return HomeCard(imgURL, location);
    }).toList();
  }
}