import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/home_card.dart';
import 'package:rent_n_rooms/models/home_card.model.dart';
import 'package:rent_n_rooms/repositories/home_cards.repository.dart';

class HomeCardsProvider with ChangeNotifier {
  HomeCardRepository _homeCardRepository = HomeCardRepository();

  Future<List<HomeCard>> getHomeCards() async {
    return await _homeCardRepository.fetchHomeCards();
  }

  // Should the provider return the builder ❓❓
  // Future<List<HomeCardBuilder>> getFutureHomeCards() async {
  //   var homeCards =  await _homeCardRepository.fetchHomeCards();
  //   return homeCards.map((card) {
  //     return new HomeCardBuilder(imgURL: card.getImgUrl(), location: card.getLocation());
  //   });
  // }
}