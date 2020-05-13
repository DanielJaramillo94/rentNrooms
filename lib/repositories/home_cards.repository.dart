import 'package:rent_n_rooms/models/home_card.model.dart';

class HomeCardRepository {

  final String url = 'https://reqres.in/api/users';

  Future<List<HomeCard>> fetchHomeCards() async {
    return await Future.delayed(
      Duration(seconds: 5),
      () => [
          HomeCard('assets/images/apartment1.jpg', 'Poblado, Medellín'),
          HomeCard('assets/images/apartment2.jpg', 'Bronkx, Bogotá'),
          HomeCard('assets/images/apartment3.jpg', 'El Raudal, Medellín'),
        ]
    );
  }
  
  // ❗ uncommnet this function and comment the previous one to make the http calls
  // ❗ also remember to change AssetImage for NetworkImage in home_card.dart, line 25
  // Future<List<HomeCard>> fetchHomeCards() async {
  //   http.Response response =  await http.get(url);
  //   Map data = json.decode(response.body);
  //   List homeCards = data['data'];
  //   return homeCards.map((obj) {
  //     String imgURL = obj['avatar'];
  //     String location = obj['first_name'];
  //     return HomeCard(imgURL, location);
  //   }).toList();
  // }
}