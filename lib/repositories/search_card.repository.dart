import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/search_card.model.dart';
import 'package:rent_n_rooms/providers/city.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/services/api.service.dart';

class SearchCardRepository {
  Future<int> getLength(DateProvider date, CityProvider codeCity) async {
    String checkin = date.getDates().getDateCheckin().toString().split(" ")[0];
    String checkout =
        date.getDates().getDateCheckout().toString().split(" ")[0];
    String code = codeCity.citySelected.codeCity;

    String url = ApiService.searchEndPoint(code, checkin, checkout);
    http.Response response = await http.get(url);
    List data = json.decode(response.body);
    List searchCards = data;
    return searchCards.length;
  }

  Future<List<SearchCard>> fetchSearchCards(
      DateProvider date, CityProvider codeCity) async {
    String checkin = date.getDates().getDateCheckin().toString().split(" ")[0];
    String checkout =
        date.getDates().getDateCheckout().toString().split(" ")[0];
    String code = codeCity.citySelected.codeCity;
    print('Fechas $checkin $checkout codigo $code');

    String url = ApiService.searchEndPoint(code, checkin, checkout);

    http.Response response = await http.get(url);
    List data = json.decode(response.body);
    List searchCards = data;
    //searchCards = await searchAllEndPoint(code, checkin, checkout); //Todos los endpoints
    return searchCards.map((obj) {
      String imgURL = obj['thumbnail'];
      String location = obj['location']['name'];
      String rating = obj['rating'].toString();
      String property = obj['property_name'];
      num price = obj['price']; 
      String idRoom = obj['id'].toString();
      String agency = obj['agency']['name'];
      return SearchCard(
          imgURL, location, rating, property, price, idRoom, agency);
    }).toList();
  }

  searchAllEndPoint(code, checkin, checkout) async {
    List urls = ApiService.searchAllEndPoint(code, checkin, checkout);
    var futures = <Future>[];
    urls.forEach((url) {
      print(url);
      futures.add(http.get(url));
    });
    List result = await Future.wait(futures);
    print(json.decode(result[0].body));
    List searchCards = [];
    result.forEach((rooms) {
      searchCards.addAll(json.decode(rooms.body));
    });
    return searchCards;
  }
}
