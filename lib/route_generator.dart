import 'package:flutter/material.dart';

import 'package:rent_n_rooms/home.page.dart';
import 'package:rent_n_rooms/Booking.dart'; //el archivo debe empezar en minúscula
import 'package:rent_n_rooms/place_details.dart';
import 'package:rent_n_rooms/result_card.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
  //usar en caso de que sea necesario pasar argumentos por el constructor
  // final args = settings.arguments;

   switch (settings.name) {
     case '/':
       return MaterialPageRoute(builder: (_) => MyHomePage());
       break;
     case '/booking':
       return MaterialPageRoute(builder: (_) => Booking());
       break;
     case '/place_details':
       return MaterialPageRoute(builder: (_) => PlaceDetails());
       break;
     case '/result_cards':
       return MaterialPageRoute(builder: (_) => ResultCard());
       break;
     default:
      return MaterialPageRoute(builder: (_) => MyHomePage());
   }
  }
}