class SearchCard {
  final String _imgURL;
  final String _location;
  final String _rating;
  final String _placeName;
  final num _price;
  
  SearchCard(this._imgURL, this._location, this._rating, this._placeName, this._price);

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
}