class DataBooking {
  String _email;
  String _name;
  String _idRoom;
  String _idBooking;

  DataBooking(this._email, this._name, this._idRoom, this._idBooking);

  String getEmail() {
    return this._email;
  }

  String getName() {
    return this._name;
  }

  String getIdRoom() {
    return this._idRoom;
  }

  String getIdBooking() {
    return this._idBooking;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setName(String name) {
    this._name = name;
  }

  void setIdRoom(String idRoom) {
    this._idRoom = idRoom;
  }

  void setIdBooking(String idBooking) {
    this._idBooking = idBooking;
  }
}
