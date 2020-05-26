import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/repositories/booking.repository.dart';

class BookingProvider with ChangeNotifier {
  DataBooking _booking = DataBooking('email', 'name', 'idRoom', '');
  BookingRepository _bookingRepository = BookingRepository();

  void updateBooking(
      String name, String email, String idRoom, String idBooking) {
    _booking.setName(name);
    _booking.setEmail(email);
    _booking.setIdRoom(idRoom);
    _booking.setIdBooking(idBooking);
  }

  void notify(){
    notifyListeners();
  }

  void updateWithoutNotify(String name, String email,  String idRoom) {
    _booking.setName(name);
    _booking.setEmail(email);
    _booking.setIdRoom(idRoom);
  }

  DataBooking getBooking() {
    return _booking;
  }

  void resetBookingId(){
    this._booking.setIdBooking('');
  }

  Future<DataBooking> createBooking(DatePicker date, String agencia) async {
    return await _bookingRepository.createBooking(_booking, date, agencia);
  }
}
