import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/place.model.dart';
// import 'package:rent_n_rooms/repositories/place_details.repository.dart';

class PlaceProvider with ChangeNotifier {
  //❗❗ debido al diseño de la API, por ahora es innecesario el uso de este repositorio
  // PlaceRepository _placeRepository = PlaceRepository();

  Place place = new Place("https://www.google.com.co/url?sa=i&url=https%3A%2F%2Fwww.booking.com%2Fhotel%2Fco%2Fwhyndam.html&psig=AOvVaw3GN4jW9nVyhiEwGJTyUW3K&ust=1589409021228000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCODfp5Swr-kCFQAAAAAdAAAAABAD", "_placeName", "_location", 0.0, "_description", 2.0, ["service1"], "_idRoom", "_agency");

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

  Future<Place> getPlace() async {
    return place;
  }

  void setPlace(Place newPlace) {
    place = newPlace;
  }

  //Decidir sobre el uso de los gets, con Future y sin Future
  Place getRoom() {
    return place;
  }
}
