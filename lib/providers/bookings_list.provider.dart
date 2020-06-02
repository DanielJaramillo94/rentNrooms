import 'package:flutter/material.dart';
import 'package:rent_n_rooms/models/bookingg.model.dart';
import 'package:rent_n_rooms/repositories/bookings_list.repository.dart';

class BookingsListProvider with ChangeNotifier {
  BookingsListRepository _bookingsListRepository = BookingsListRepository();

  Future<List<Bookingg>> fetchBookings(BuildContext context) async {
    return await _bookingsListRepository.fetchBookigsList('daniel.jaramillo7@udea.edu.co');
  }
}