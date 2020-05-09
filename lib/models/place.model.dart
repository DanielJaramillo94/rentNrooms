class Place {
  final String _picture;
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
    this._agency
  );

  String getPicture() {
    return this._picture;
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
