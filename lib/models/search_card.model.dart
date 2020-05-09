class SearchCard {
  final String _imgURL;
  final String _location;
  final String _rating;
  final String _placeName;
  final num _price;
  final String idRoom;
  final String agency;

  SearchCard(this._imgURL, this._location, this._rating, this._placeName,
      this._price, this.idRoom, this.agency);

  String getImgUrl() {
    return this._imgURL;
  }

  String getLocation() {
    return this._location;
  }

  String getRating() {
    return this._rating;
  }

  String getProperty() {
    return this._placeName;
  }

  num getPrice() {
    return this._price;
  }

  String getAgency() {
    return this.agency;
  }

  String getIdRoom() {
    return this.idRoom;
  }
}
