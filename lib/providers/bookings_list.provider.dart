import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/auth.service.dart';
import 'package:rent_n_rooms/models/bookingg.model.dart';
import 'package:rent_n_rooms/models/user.model.dart';
import 'package:rent_n_rooms/repositories/bookings_list.repository.dart';

class BookingsListProvider with ChangeNotifier {
  BookingsListRepository _bookingsListRepository = BookingsListRepository();

  Future<List<Bookingg>> fetchBookings(BuildContext context) async {
    final authService = Provider.of<AuthService>(context);
    User user = await authService.currentUser();
    return await _bookingsListRepository.fetchBookigsList(user.getEmail());
  }
}