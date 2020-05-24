class RoomCard {
  final String _imgURL;
  final String _location;
  final double _rating;
  final String _placeName;
  final double _price;
  final String idRoom;
  final String agency;

  RoomCard(this._imgURL, this._location, this._rating, this._placeName,
      this._price, this.idRoom, this.agency);

  String getImgUrl() {
    return this._imgURL;
  }

  String getLocation() {
    return this._location;
  }

  double getRating() {
    return this._rating;
  }

  String getProperty() {
    return this._placeName;
  }

  double getPrice() {
    return this._price;
  }

  String getAgency() {
    return this.agency;
  }

  String getIdRoom() {
    return this.idRoom;
  }
}
