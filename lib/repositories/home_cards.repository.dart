import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:rent_n_rooms/models/home_card.model.dart';
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'package:rent_n_rooms/services/api.service.dart';

class HomeCardRepository {

  final String url = 'https://reqres.in/api/users';

  Future<List<HomeCard>> fetchHomeCards2() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => [
          HomeCard('assets/images/apartment1.jpg', 'Poblado, Medellín'),
          HomeCard('assets/images/apartment2.jpg', 'Bronkx, Bogotá'),
          HomeCard('assets/images/apartment3.jpg', 'El Raudal, Medellín'),
        ]
    );
  }

  Future<List<HomeCard>> fetchHomeCards() async {
    List<String> apiUrls = ApiService.searchEndPointLambda();
    List<RoomCard> roomsCards = [];
    for (String url in apiUrls) {
      http.Response response = await http.get(url);
      List apiRoomsData;
      //try statement because this could cause the api could not respond, or not respond with json
      try {
        apiRoomsData = json.decode(response.body);
      } catch (e) {
        debugPrint('error in api endpoint -> ' + url);
        debugPrint(e.toString());
        continue;
      }
      RoomCard roomCard;
      //try statement because this could cause error due to malformations in json response
      try {
        roomCard = RoomCard.fromJSON(apiRoomsData[0]);
      } catch (e) {
        debugPrint('error decoding json data in api endpoint -> ' + url);
        debugPrint(e.toString());
      }
      roomsCards.add(roomCard);
    }
    return  [
              HomeCard(roomsCards[0].getImgUrl(), roomsCards[0].getLocation()),
              HomeCard(roomsCards[1].getImgUrl(), roomsCards[1].getLocation()),
              HomeCard(roomsCards[2].getImgUrl(), roomsCards[2].getLocation()),
              HomeCard(roomsCards[3].getImgUrl(), roomsCards[3].getLocation()),
            ];
  }
  
  // ❗ uncommnet this function and comment the previous one to make the http calls
  // ❗ also remember to change AssetImage for NetworkImage in home_card.dart, line 25
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