class Bookingg {
  final String _agency;
  final String _checkin;
  final String _checkout;
  final String _currency;
  final String _idBooking;
  final String _idRoom;
  final String _location;
  final double _price;
  final String _roomName;
  final String _thumbnail;

  Bookingg(
      this._agency,
      this._checkin,
      this._checkout,
      this._currency,
      this._idBooking,
      this._idRoom,
      this._location,
      this._price,
      this._roomName,
      this._thumbnail);

  factory Bookingg.fromJSON(jsonRoom) {
    String agency = jsonRoom['agency']['name'];
    String checkin = jsonRoom['checkin'];
    String checkout = jsonRoom['checkout'];
    String currency = jsonRoom['currency'];
    String idBooking = jsonRoom['id_booking'];
    String idRoom = jsonRoom['id_room'].toString();
    String location = jsonRoom['location']['name'];
    double price = jsonRoom['price'].toDouble();
    String roomName = jsonRoom['property_name'];
    String thumbnail = jsonRoom['thumbnail'];

    return Bookingg(agency, checkin, checkout, currency, idBooking, idRoom,
        location, price, roomName, thumbnail);
  }

  String getAgency() {
    return this._agency;
  }

  String getCheckin() {
    return this._checkin;
  }

  String getCheckout() {
    return this._checkout;
  }

  String getCurrency() {
    return this._currency;
  }

  String getIdBooking() {
    return this._idBooking;
  }

  String getIdRoom() {
    return this._idRoom;
  }

  String getLocation() {
    return this._location;
  }

  double getPrice() {
    return this._price;
  }

  String getRoomName() {
    return this._roomName;
  }

  String getThumbnail() {
    return this._thumbnail;
  }
}
