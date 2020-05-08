import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'dart:convert';


class BookingRepository {
  final String url = 'https://a0f8d7d5-cce0-410a-8fcc-50d521534131.mock.pstmn.io/booking';

  Future<Map> createBooking(Booking booking, DatePicker date) async {
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
      return data;
    } catch (err) {
      print(err);
      return {'err': 'Lo sentimos, no se pudo realizar la reserva'};
    }
  }
}
