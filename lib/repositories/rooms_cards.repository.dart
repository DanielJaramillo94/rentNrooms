import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'dart:convert';

class RoomsCardsRepository {

  List<String> apiUrls = [
    'https://next.json-generator.com/api/json/get/EJI3axNsd',
    'https://next.json-generator.com/api/json/get/41yh2gEsd',
    'https://next.json-generator.com/api/json/get/NyXqvgEj_',
  ];

  Future<List<RoomCard>> fetchRoomsCards() async {
    List<RoomCard> roomsCards = [];
    for (String url in apiUrls) {
      http.Response response = await http.get(url);
      List apiRoomsData;
      try {
        apiRoomsData = json.decode(response.body);
      } catch (e) {
        log('error in api endpoint -> ' + url);
        debugPrint(e.toString());
        continue;
      }

      apiRoomsData.forEach((roomData) {
        RoomCard roomCard;
        try { //because this could cause error due to malformations in json response
          roomCard = RoomCard.fromJSON(roomData);
        } catch (e) {
          log('error decoding json data in api endpoint -> ' + url);
          debugPrint(e.toString());
          return;
        }
        roomsCards.add(roomCard);
      });
    }
    return Future.value(roomsCards);
  }
}
