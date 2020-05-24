import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'package:rent_n_rooms/repositories/rooms_cards.repository.dart';

class RoomsCardsProvider with ChangeNotifier {
  RoomsCardsRepository _roomsCardsRepository = RoomsCardsRepository();
  
  Future<List<RoomCard>> fetchRoomsCards() async {
    return await _roomsCardsRepository.fetchRoomsCards();
  }
}