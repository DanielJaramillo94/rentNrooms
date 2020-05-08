class Booking {
  String _email;
  String _name;
  String _idRoom;

  Booking(this._email, this._name, this._idRoom);

  String getEmail() {
    return this._email;
  }

  String getName() {
    return this._name;
  }

  String getIdRoom() {
    return this._idRoom;
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
}
