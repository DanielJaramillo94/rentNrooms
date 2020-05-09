import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/services/api.service.dart';
import 'dart:convert';


class BookingRepository {  

  Future<DataBooking> createBooking(
      DataBooking booking, DatePicker date, String agencia) async {
      String url = ApiService.bookingEndPoint(agencia);        

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
            'id_room': '${booking.getIdRoom()}'
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
