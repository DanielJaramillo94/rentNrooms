import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/bookingg.model.dart';
import 'dart:convert';

import 'package:rent_n_rooms/services/api.service.dart';

class BookingsListRepository {
  Future<List<Bookingg>> fetchBookigsList(
      String email) async {
    List<String> apiUrls = ApiService.bookings(email);
    
    List<Bookingg> bookings = [];
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

      apiRoomsData.forEach((bookingData) {
        Bookingg booking;
        //try statement because this could cause error due to malformations in json response
        try {
          booking = Bookingg.fromJSON(bookingData);
        } catch (e) {
          debugPrint('error decoding json data in api endpoint -> ' + url);
          debugPrint(e.toString());
          return;
        }
        bookings.add(booking);
      });
    }
    return Future.value(bookings);
  }
}
