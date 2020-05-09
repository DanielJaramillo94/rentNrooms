import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'dart:convert';

import 'package:rent_n_rooms/services/service.dart';

class BookingRepository {
  static Api api = Api();
  static String url = api.bookingEndPoint('Arrendamientos njs');

  Future<DataBooking> createBooking(
      DataBooking booking, DatePicker date) async {
    print("createBookingHttp");
    print(
        'Email: ${booking.getEmail()} Id: ${booking.getIdRoom()} Name: ${booking.getName()}');
    try {
      String checkin = date.getDateCheckin().toString().split(" ")[0];
      String checkout = date.getDateCheckout().toString().split(" ")[0];
      print('checkin $checkin checkout $checkout');
      print(url);

      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'checkin': '$checkin',
            'checkout': '$checkout',
            'email': '${booking.getEmail()}',
            'name': '${booking.getName()}',
            'id_room': '5eb24077bf3587508244c267'
          }));
      Map data = json.decode(response.body);
      print("data");
      print(data);
      DataBooking newBooking = DataBooking(
          data['email'], data['name'], data['id_room'], data['id_booking']);
      return newBooking;
    } catch (err) {
      throw ('Lo sentimos, ocurrió un error con ');
    }
  }
}
