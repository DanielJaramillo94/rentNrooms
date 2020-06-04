class User {
  final String _name;
  final String _email;
  final String _photoUrl;

  User(this._name, this._email, this._photoUrl);

  String getName() {
    return this._name;
  }

  String getEmail() {
    return this._email;
  }

  String getPhotoUrl() {
    return this._photoUrl;
  }
}