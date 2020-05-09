import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_n_rooms/providers/city.provider.dart';

import 'package:rent_n_rooms/route_generator.dart';

import 'package:provider/provider.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/providers/home_cards.provider.dart';
import 'package:rent_n_rooms/providers/search_card.provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookingProvider>.value(
          value: BookingProvider(),
        ),
        ChangeNotifierProvider<DateProvider>.value(
          value: DateProvider(),
        ),
        ChangeNotifierProvider<PlaceProvider>.value(
          value: PlaceProvider(),
        ),
        ChangeNotifierProvider<HomeCardsProvider>.value(
          value: HomeCardsProvider(),
        ),
        ChangeNotifierProvider<SearchCardProvider>.value(
          value: SearchCardProvider(),
        ),
        ChangeNotifierProvider<CityProvider>.value(
          value: CityProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rent & Rooms',
        initialRoute: '/result_cards',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}