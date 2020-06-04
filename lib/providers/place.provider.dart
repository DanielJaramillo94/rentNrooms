import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/repositories/place_details.repository.dart';

class PlaceProvider with ChangeNotifier {
  PlaceRepository _placeRepository = PlaceRepository();

  String idRoom;
  String agency;
  Place room;

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
