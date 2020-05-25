import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/room_card.model.dart';
import 'package:rent_n_rooms/providers/rooms_list.provider.dart';

import 'package:rent_n_rooms/search_card.dart';

class RoomsListPage extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    RoomsCardsProvider roomsCardsProvider =
        Provider.of<RoomsCardsProvider>(context);
    Future<List<RoomCard>> roomsCards = roomsCardsProvider.fetchRoomsCards();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Resultados',
          style: TextStyle(fontFamily: 'Cocogoose'),
        ),
        backgroundColor: mainColorLighter,
      ),
      body: FutureBuilder<List<RoomCard>>(
        future: roomsCards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                RoomCard roomCard = snapshot.data[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SearchCardBuilder(
                    imgURL: roomCard.getImgUrl(),
                    location: roomCard.getLocation(),
                    rating: roomCard.getRating(),
                    placeName: roomCard.getPlaceName(),
                    price: roomCard.getPrice(),
                    idRoom: roomCard.getIdRoom(),
                    agency: roomCard.getAgency(),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
