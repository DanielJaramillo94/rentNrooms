import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/repositories/booking.repository.dart';

class BookingProvider with ChangeNotifier {
  DataBooking _booking = DataBooking('', '', '', '');
  BookingRepository _bookingRepository = BookingRepository();

  void updateBooking(
      String name, String email, String idRoom, String idBooking) {
    _booking.setName(name);
    _booking.setEmail(email);
    _booking.setIdRoom(idRoom);
    _booking.setIdBooking(idBooking);
    notifyListeners();
  }

  DataBooking getBooking() {
    return _booking;
  }

  Future<DataBooking> createBooking(DatePicker date, String agencia) async {
    return await _bookingRepository.createBooking(_booking, date, agencia);
  }
}
