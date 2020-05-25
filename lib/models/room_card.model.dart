class RoomCard {
  final String _imgURL;
  final String _location;
  final double _rating;
  final String _placeName;
  final double _price;
  final String _idRoom;
  final String _agency;

  RoomCard(this._imgURL, this._location, this._rating, this._placeName,
      this._price, this._idRoom, this._agency);

  factory RoomCard.fromJSON(jsonRoom) {
    String imgURL = jsonRoom['thumbnail'];
    String location = jsonRoom['location']['name'];
    double rating = jsonRoom['rating'].toDouble();
    String placeName = jsonRoom['property_name'];
    double price = jsonRoom['price'].toDouble();
    String idRoom = jsonRoom['id'].toString();
    String agency = jsonRoom['agency']['name'];

    return RoomCard(imgURL, location, rating, placeName,
        price, idRoom, agency);
  }

  String getImgUrl() {
    return this._imgURL;
  }

  String getLocation() {
    return this._location;
  }

  double getRating() {
    return this._rating;
  }

  String getPlaceName() {
    return this._placeName;
  }

  double getPrice() {
    return this._price;
  }

  String getAgency() {
    return this._agency;
  }

  String getIdRoom() {
    return this._idRoom;
  }
}
