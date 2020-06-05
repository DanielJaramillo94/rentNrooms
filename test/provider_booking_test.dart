import 'package:flutter_test/flutter_test.dart';
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';

void main() {
  test('Update booking', () {
    BookingProvider bp = BookingProvider();
    bp.updateBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
    expect(bp.getBooking().getName(), "Jorge Hiler");
    expect(bp.getBooking().getEmail(), "andreshiler@gmail.com");
    expect(bp.getBooking().getIdRoom(), "1234");
    expect(bp.getBooking().getIdBooking(), "2");
  });

  test('Get booking', () {
    BookingProvider bp = BookingProvider();
    DataBooking booking =
        DataBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
    bp.updateBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
    identical(bp.getBooking(), booking);
  });

  test('Reset booking id', () {
    BookingProvider bp = BookingProvider();
    bp.updateBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
    bp.resetBookingId();
    expect(bp.getBooking().getIdBooking(), '');
  });

  test('Update without notify', () {
    BookingProvider bp = BookingProvider();
    bp.updateBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
    bp.updateWithoutNotify("Esteban", "estaban@gmail.com", "9");
    expect(bp.getBooking().getName(), 'Esteban');
    expect(bp.getBooking().getEmail(), 'estaban@gmail.com');
    expect(bp.getBooking().getIdRoom(), '9');
  });

  // test("Create booking ", () {
  //   BookingProvider bp = BookingProvider();
  //   DatePicker datePicker =
  //       DatePicker(DateTime.now(), DateTime.now().add(Duration(days: 5)));
  //   DataBooking dataBooking =
  //       DataBooking("Jorge Hiler", "andreshiler@gmail.com", "1234", "2");
  //   Future<DataBooking> future = bp.createBooking(datePicker, 'Lambda Team');
  //   expect(
  //       future,
  //       completion(equals({
  //         'checkin': datePicker.getCheckoutString(),
  //         'checkout': datePicker.getCheckoutString(),
  //         'email': '${dataBooking.getEmail()}',
  //         'name': '${dataBooking.getName()}',
  //       })));
  // });
}
