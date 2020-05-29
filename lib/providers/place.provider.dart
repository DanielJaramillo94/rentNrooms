import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/repositories/place_details.repository.dart';

class PlaceProvider with ChangeNotifier {
  PlaceRepository _placeRepository = PlaceRepository();

  String idRoom;
  String agency;
  Place room;

  String formatPrice(double cost) {
    var end = '';
    var part = cost.toString();
    String price = part.split('.')[0];
    String dec = part.split('.')[1];
    if (price.length > 3 && price.length <= 6) {
      var length = price.length - 3;
      var initial = price.substring(0, length);
      return end = initial + '.' + price.substring(length, price.length) + '.' + dec;
    } else if (price.length > 6) {
      var length = price.length - 3;
      var initial = price.substring(0, length);
      if (initial.length > 3) {
        var length2 = initial.length - 3;
        var initial2 = initial.substring(0, length2);
        initial = initial2 + "'" + price.substring(length, price.length);
      }
      return end = initial + '.' + price.substring(length, price.length) + '.' + dec;
    }
    return price + '.' + dec;
  }

  Future<Place> fetchRoom(String agency, String idRoom) async {
    Place room = await _placeRepository.fetchRoom(agency, idRoom);
    setRoom(room);
    return room;
  }

  void setRoom(Place newRoom) {
    room = newRoom;
  }

  void setIdRoom(String idRoom) {
    this.idRoom = idRoom;
  }

  String getIdRoom() {
    return idRoom;
  }

  void setAgency(String agency) {
    this.agency = agency;
  }

  String getAgency() {
    return agency;
  }

  Place getRoom() {
    return room;
  }
}
