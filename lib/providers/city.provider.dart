import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/city.model.dart';

class CityProvider with ChangeNotifier {

  City _citySelected = City(nameCity: 'City', codeCity: '00'); 

  City get citySelected => _citySelected; 

  set citySelected(City city) {
    _citySelected = city; 
    notifyListeners();
  }
}