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
    [this._photos]
  );

  factory Place.fromJSON(Map jsonRoom) {
    String id = jsonRoom['id'].toString();
    List _images = jsonRoom['images']; //this is List<dynamic> type
    List<String> images = _images.map((image) => image['url']).toList().cast<String>();
    String location = jsonRoom['location']['name'];
    double price = jsonRoom['price'].toDouble();
    // String currency = jsonRoom['currency']; currency is currently unused
    String agency = jsonRoom['agency']['name'];
    String roomName = jsonRoom['property_name'];
    double rating = jsonRoom['rating'].toDouble();
    List<String> services = jsonRoom['services'].cast<String>();

    return Place(
        images[0], roomName, location, price, '', rating, services, id, agency, images);
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
}
