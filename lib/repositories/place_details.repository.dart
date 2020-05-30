import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/services/api.service.dart';

class PlaceRepository {
  Future<Place> fetchRoom(String agency, String idRoom) async {
    String url = ApiService.detailsEndPoint(agency, idRoom);

    http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
      debugPrint('error in api endpoint -> ' + url);
      debugPrint(e.toString());
      return Place.error();
    }

    Map data;
    try {
      data = json.decode(response.body);
    } catch (e) {
      debugPrint('error in json response');
      debugPrint(e.toString());
      return Place.error();
    }
    
    return Place.fromJSON(data);
  }
  
}
