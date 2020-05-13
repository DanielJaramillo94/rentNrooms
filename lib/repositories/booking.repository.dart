import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/services/api.service.dart';
import 'dart:convert';

class BookingRepository {
  ///Para realizar la reserva se reciben las fechas seleccionadas previamente
  ///a la selección del lugar. Por esta razón la agencia se manda como parametro
  ///y no se encuentra en los providers recibidos.
  Future<DataBooking> createBooking(
      DataBooking booking, DatePicker date, String agencia) async {
    String url = ApiService.bookingEndPoint(agencia);

    try {
      String checkin = date.getDateCheckin().toString().split(" ")[0];
      String checkout = date.getDateCheckout().toString().split(" ")[0];

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
      DataBooking newBooking = DataBooking(
          data['email'], data['name'], data['id_room'].toString(), data['id_booking'].toString());
      return newBooking;
    } catch (err) {
      throw ('Lo sentimos, ocurrió un error con ');
    }
  }
}
