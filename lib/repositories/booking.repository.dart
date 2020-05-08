import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'dart:convert';

class BookingRepository {
  final String url =
      'https://a0f8d7d5-cce0-410a-8fcc-50d521534131.mock.pstmn.io/booking';

  Future<DataBooking> createBooking(
      DataBooking booking, DatePicker date) async {
    print("createBookingHttp");
    try {
      String checkin = date.getDateCheckin().toString().split(" ")[0];
      String checkout = date.getDateCheckout().toString().split(" ")[0];
      http.Response response = await http.post(url, body: {
        'checkin': checkin,
        'checkout': checkout,
        'email': booking.getEmail(),
        'name': booking.getName(),
        'id_room': booking.getIdRoom()
      });
      Map data = json.decode(response.body);
      DataBooking newBooking = DataBooking(
          data['email'], data['name'], data['id_room'], data['id_booking']);
      return newBooking;
    } catch (err) {
      throw ('Lo sentimos, ocurrió un error con ');
    }
  }
}
