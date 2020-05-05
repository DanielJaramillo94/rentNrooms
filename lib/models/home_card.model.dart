class HomeCard {
  final String _imgURL;
  final String _location;

  HomeCard(this._imgURL, this._location);

  String getImgUrl() {
    return this._imgURL;
  }

  String getLocation() {
    return this._location;
  }
}