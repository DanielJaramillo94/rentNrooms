import 'package:flutter/material.dart';

import 'package:rent_n_rooms/home.page.dart';
import 'package:rent_n_rooms/booking/booking.dart';
import 'package:rent_n_rooms/place_details.dart';
import 'package:rent_n_rooms/date.dart';
import 'package:rent_n_rooms/views/rooms_list.page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
        break;
      case '/booking':
        return MaterialPageRoute(builder: (_) => Booking());
        break;
      case '/place_details':
        return MaterialPageRoute(builder: (_) => PlaceDetails(settings.arguments));
        break;
      case '/result_cards':
        return MaterialPageRoute(builder: (_) => RoomsListPage());
        break;
      case '/date':
        return MaterialPageRoute(builder: (_) => Date());
        break;
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
