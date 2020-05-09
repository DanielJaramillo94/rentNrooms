import 'package:flutter/foundation.dart';

class Auxiliar with ChangeNotifier {
  String idRoom = '';
  String agencia = '';

  void updateAuxiliar(String idRoom, String agencia) {
    this.idRoom = idRoom;
    this.agencia = agencia;
    notifyListeners();
  }

  String getIdRoom() {
    return this.idRoom;
  }

  String getAgencia() {
    return this.agencia;
  }

  void setAgencia(String agencia) {
    this.agencia = agencia;
  }

  void setIdRoom(String idRoom) {
    this.idRoom = idRoom;
  }
}
