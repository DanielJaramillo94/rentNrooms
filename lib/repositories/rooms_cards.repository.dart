import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'dart:convert';

import 'package:rent_n_rooms/services/api.service.dart';

class RoomsCardsRepository {
  Future<List<RoomCard>> fetchRoomsCards(
      String cityCode, String checkin, String checkout) async {

    List<String> apiUrls = ApiService.searchEndPoints(cityCode, checkin, checkout);
    
    List<RoomCard> roomsCards = [];
    for (String url in apiUrls) {
      http.Response response = await http.get(url);
      List apiRoomsData;
      //try statement because this could cause the api could not respond, or not respond with json
      try {
        apiRoomsData = json.decode(response.body);
      } catch (e) {
        log('error in api endpoint -> ' + url);
        debugPrint(e.toString());
        continue;
      }

      apiRoomsData.forEach((roomData) {
        RoomCard roomCard;
        //try statement because this could cause error due to malformations in json response
        try {
          debugPrint('processing card...');
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
