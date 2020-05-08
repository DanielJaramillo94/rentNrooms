import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/booking.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/repositories/booking.repository.dart';

class BookingProvider with ChangeNotifier {

  Booking _booking = Booking('', '', '');
  BookingRepository _bookingRepository = BookingRepository();

  void updateBooking(String name, String email, String idRoom) {
    _booking.setName(name);
    _booking.setEmail(email);
    _booking.setIdRoom(idRoom);
    notifyListeners();
  }

  Booking getBooking() {
    return _booking;
  }

  Future<Map> createBooking(DatePicker date) async {
    return await _bookingRepository.createBooking(_booking, date);
  }
}
