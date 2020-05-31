import 'package:flutter/cupertino.dart';

class Place {
  final String _picture;
  final List<String> _photos;
  final String _placeName;
  final String _location;
  final double _nightPrice;
  final String _description;
  final double _rating;
  final List<String> _services;
  final String _idRoom;
  final String _agency;
  final String _logoUrl;

  Place(
    this._picture,
    this._placeName,
    this._location,
    this._nightPrice,
    this._description,
    this._rating,
    this._services,
    this._idRoom,
    this._agency,
    this._logoUrl,
    [this._photos]
  );

  factory Place.fromJSON(Map jsonRoom) {
    String id;
    List<String> images;
    String location;
    double price;
    String agency;
    String roomName;
    String logo;
    double rating;
    List<String> services;
    try {
      id = jsonRoom['id'].toString();
      List _images = jsonRoom['images']; //this is List<dynamic> type
      images = _images.map((image) => image['url']).toList().cast<String>();
      logo = jsonRoom['agency']['logo_url'];
      location = jsonRoom['location']['name'];
      price = jsonRoom['price'].toDouble();
      // String currency = jsonRoom['currency']; currency is currently unused
      agency = jsonRoom['agency']['name'];

      roomName = jsonRoom['property_name'];
      rating = jsonRoom['rating'].toDouble();
      services = new List();
      List _services = jsonRoom['services'];
      _services.forEach((service) => (services.add(service)));
    } catch (e) {
      debugPrint('error parsing json data');
      debugPrint(e.toString());
      return new Place.error();
    }

    return Place(images[0], roomName, location, price, '', rating, services, id,
        agency, logo, images);
  }
  factory Place.error() {
    return Place('', 'error', 'error', 0, 'error', 0, null, 'error',
        'error', 'error');
  }


  String getPicture() {
    return this._picture;
  }

  List<String> getPhotos() {
    return this._photos;
  }

  String getPlaceName() {
    return this._placeName;
  }

  String getLocation() {
    return this._location;
  }

  double getNightPrice() {
    return this._nightPrice;
  }

  String getDescription() {
    return this._description;
  }

  double getRating() {
    return this._rating;
  }

  List<String> getServices() {
    return this._services;
  }

    String getIdRoom() {
    return this._idRoom;
  }

    String getAgency() {
    return this._agency;
  }

  String getLogo() {
    return this._logoUrl;
  }
}
