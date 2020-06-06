import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/book_card.builder.dart';
import 'package:rent_n_rooms/models/bookingg.model.dart';
import 'package:rent_n_rooms/providers/bookings_list.provider.dart';

import '../myFadeLogo.dart';

class BookingsListPage extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    BookingsListProvider bookingsListProvider =
        Provider.of<BookingsListProvider>(context);
    Future<List<Bookingg>> bookingsList =
        bookingsListProvider.fetchBookings(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Reservas',
          style: TextStyle(fontFamily: 'Cocogoose'),
        ),
        backgroundColor: mainColorLighter,
      ),
      body: FutureBuilder<List<Bookingg>>(
        future: bookingsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Bookingg> bookings = snapshot.data;
            if (bookings.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '¡Vaya! Parece que no has hecho ninguna reserva aún',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Cocogoose',
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: BookingCardBuilder(booking: bookings[index]),
                  );
                },
              );
            }
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MyFadeLogo(),
              ),
            );
          }
        },
      ),
    );
  }
}
