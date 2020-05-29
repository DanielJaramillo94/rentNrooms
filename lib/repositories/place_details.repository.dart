import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/services/api.service.dart';

class PlaceRepository {
  Future<Place> fetchRoom(String agency, String idRoom) async {
    
    String url = ApiService.detailsEndPoint(agency, idRoom);
    http.Response response =  await http.get(url);
    Map data = json.decode(response.body);
    return Place.fromJSON(data);
  }
  
}
