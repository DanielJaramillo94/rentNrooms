import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/place.model.dart';
// import 'package:rent_n_rooms/repositories/place_details.repository.dart';

class PlaceProvider with ChangeNotifier {
  //❗❗ debido al diseño de la API, por ahora es innecesario el uso de este repositorio
  // PlaceRepository _placeRepository = PlaceRepository();

  Place place;

  Future<Place> getPlace() async {
    return place;
  }
  
  void setPlace(Place newPlace) {
    place = newPlace;
  }
}