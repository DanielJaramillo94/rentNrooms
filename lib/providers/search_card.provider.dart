import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/home_card.dart';
import 'package:rent_n_rooms/models/search_card.model.dart';
import 'package:rent_n_rooms/repositories/search_card.repository.dart';

class SearchCardProvider with ChangeNotifier {
  SearchCardRepository _searchCardRepository = SearchCardRepository();

  Future<List<SearchCard>> getSearchCards() async {
    return await _searchCardRepository.fetchSearchCards();
  }
}