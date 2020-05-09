import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/repositories/place_details.repository.dart';

class PlaceProvider with ChangeNotifier {
  PlaceRepository _placeRepository = PlaceRepository();

  Future<Place> getPlace() async {
    return await _placeRepository.fetchPlace();
  }
}