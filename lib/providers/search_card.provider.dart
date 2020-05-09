import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/home_card.dart';
import 'package:rent_n_rooms/models/search_card.model.dart';
import 'package:rent_n_rooms/repositories/search_card.repository.dart';

class SearchCardProvider with ChangeNotifier {
  SearchCardRepository _searchCardRepository = SearchCardRepository();

  Future<int> getNumberCards() {
    return SearchCardRepository().getLength();
  }

  String formatPrice(num cost)  {
    var end = '';
    var part = cost.toString();
    String price = part.split(".")[0];
    if (price.length > 3 && price.length <= 6) {

      var length = price.length - 3;
      var initial = price.substring(0, length);
      return end = initial + "." + price.substring(length, price.length);

    } else if (price.length > 6) {

      var length = price.length - 3;
      var initial = price.substring(0, length);
      if (initial.length > 3) {
        
        var length2 = initial.length - 3;
        var initial2 = initial.substring(0, length2);
        initial = initial2 + "'" + price.substring(length, price.length);
      }
      return end = initial + "." + price.substring(length, price.length);
    }
    return price;
  }

  Future<List<SearchCard>> getSearchCards() async {
    return await _searchCardRepository.fetchSearchCards();
  }
}