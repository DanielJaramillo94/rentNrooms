import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_n_rooms/models/booking.model.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

import 'messages/errorMessage.dart';
import 'messages/successMessage.dart';
import 'messages/waitingMessage.dart';


final Color mainColor = Color(0xFF006BB1);
final Color mainColorMiddle = Color(0xFF2195C6);
final Color mainColorLighter = Color(0xFF42BEBD);

void onBooking(BuildContext context, BookingProvider booking,
    DateProvider dates, PlaceProvider place) {
  final _controllerEmail =
      TextEditingController(text: booking.getBooking().getEmail());
  final _controllerName =
      TextEditingController(text: booking.getBooking().getName());

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 200,
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        Text('Ingresa tus datos para terminar',
                            style: TextStyle(
                                fontFamily: 'Cocogose',
                                fontSize: 18,
                                color: mainColorLighter,
                                fontWeight: FontWeight.w400)),
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: IconButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                booking.updateBooking(
                                    _controllerName.text,
                                    _controllerEmail.text,
                                    place.getRoom().getIdRoom(),
                                    '');
                                Future<DataBooking> newBooking =
                                    booking.createBooking(
                                        dates.getDates(), 'Arrendamientos njs');
                                createAlertDialog(context, newBooking, booking);
                              },
                              icon: Icon(
                                Icons.done,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                    TextField(
                      controller: _controllerEmail,
                      onTap: () {},
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Correo",
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      maxLines: 1,
                    ),
                    TextField(
                      controller: _controllerName,
                      onTap: () {},
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.assignment_ind),
                          hintText: "Nombre",
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      maxLines: 1,
                    ),
                  ]),
            ),
          ),
        );
      });
}

createAlertDialog(BuildContext context, Future<DataBooking> newBooking,
    BookingProvider booking) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FutureBuilder(
            future: newBooking,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data) {
                  return ErrorMessage();
                }
                DataBooking db = snapshot.data;
                booking.updateBooking(db.getName(), db.getEmail(),
                    db.getIdRoom(), db.getIdBooking());
                return Container(
                  height: 200.0,
                  child: SuccessMessage(snapshot.data.getIdBooking()),
                );
              } else {
                return WaitingMessage();
              }
            },
          ),
        );
      });
}
