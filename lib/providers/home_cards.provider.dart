import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/home_card.model.dart';
import 'package:rent_n_rooms/repositories/home_cards.repository.dart';

class HomeCardsProvider with ChangeNotifier {
  List<HomeCard> _homeCards;
  HomeCardRepository _homeCardRepository = HomeCardRepository();
  bool _loading = true;

  String fakeAparmentName = 'This is a fake name';

  String getApartmentName() {
    return fakeAparmentName;
  }

  setApartmentName(newName) {
    fakeAparmentName = newName;
    notifyListeners();
  }
  
  Future<String> getFutureApartmentName() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () =>'This a future name!'
    );
  }

  Future<List<HomeCard>> getHomeCards() async {
    return await _homeCardRepository.fetchHomeCards();
  }

  List<HomeCard> getLocalHomeCards() {
    return _homeCardRepository.localHomeCards();
  }

  HomeCard getCard(int index) => _homeCards[index];
}