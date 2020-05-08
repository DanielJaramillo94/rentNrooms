import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/home_card.model.dart';
import 'package:rent_n_rooms/repositories/home_cards.repository.dart';


class HomeCardsProvider with ChangeNotifier {
  HomeCardRepository _homeCardRepository = HomeCardRepository();

  Future<List<HomeCard>> getHomeCards() async {
    return await _homeCardRepository.fetchHomeCards();
  }
}