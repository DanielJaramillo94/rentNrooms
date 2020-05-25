import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'package:rent_n_rooms/providers/city.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/repositories/rooms_cards.repository.dart';

class RoomsCardsProvider with ChangeNotifier {
  RoomsCardsRepository _roomsCardsRepository = RoomsCardsRepository();

  Future<List<RoomCard>> fetchRoomsCards(BuildContext context) async {
    DateProvider dateProvider = Provider.of<DateProvider>(context);
    CityProvider cityProvider = Provider.of<CityProvider>(context);

    String cityCode = cityProvider.citySelected.codeCity;
    String checkin = dateProvider.datePicker.checkinYYYYMMDD();
    String checkout = dateProvider.datePicker.checkoutYYYYMMDD();

    return await _roomsCardsRepository.fetchRoomsCards(cityCode, checkin, checkout);
  }
}