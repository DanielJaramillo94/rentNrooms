import 'package:http/http.dart' as http;
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'dart:convert';

import 'package:rent_n_rooms/models/search_card.model.dart';
import 'package:rent_n_rooms/providers/city.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/services/api.service.dart';

class RoomsCardsRepository {
  Future<List<RoomCard>> fetchRoomsCards() async {
    return await Future.delayed(
      Duration(seconds: 3),
      () => [
        RoomCard(
            'https://specials-images.forbesimg.com/imageserve/1026205392/960x0.jpg?fit=scale',
            'whatever',
            4.3,
            'whatever',
            300,
            'whatever',
            'whatever'),
        RoomCard(
            'https://images.adsttc.com/media/images/5be9/fd5c/08a5/e5a5/8c00/008f/newsletter/CARLES_FAUS_ARQUITECTURA_-_CARMEN_HOUSE_(2).jpg?1542061390',
            'whatever',
            4.3,
            'whatever',
            300,
            'whatever',
            'whatever'),
        RoomCard(
            'https://specials-images.forbesimg.com/imageserve/1026205392/960x0.jpg?fit=scale',
            'whatever',
            4.3,
            'whatever',
            300,
            'whatever',
            'whatever'),
        RoomCard(
            'https://images.adsttc.com/media/images/5be9/fd5c/08a5/e5a5/8c00/008f/newsletter/CARLES_FAUS_ARQUITECTURA_-_CARMEN_HOUSE_(2).jpg?1542061390',
            'whatever',
            4.3,
            'whatever',
            300,
            'whatever',
            'whatever'),
      ],
    );
  }
}
