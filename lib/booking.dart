import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';

import 'providers/date_picker.provider.dart';

class Booking extends StatelessWidget {
  final String sector = 'El Poblado';
  final double price = 30000.0;
  final String rating = '5,0';
  final String img = 'assets/images/apartment1.jpg';
  final DateTime input = DateTime.now();
  final DateTime output = DateTime.now().add(Duration(days: 28));

  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  final Map<int, String> monthsName = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre'
  };

  void _onBooking(
      BuildContext context, BookingProvider booking, DateProvider dates) {
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
                                  booking.updateBooking(_controllerName.text,
                                      _controllerEmail.text, "444");
                                  Future<Map> newBooking = booking.createBooking(dates.getDates());
                                  print('creando...');
                                  return FutureBuilder<Map>(
                                    future: newBooking,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        print("hay DAtos");
                                        return AlertDialog(
                                          title: Text('Su reversa se realizó exitosamente/n '),
                                        );
                                      } else {
                                        print("no hay datos");
                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                    },
                                  );
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
    ;
  }

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);
    final dates = Provider.of<DateProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Información de reserva',
            style:
                TextStyle(fontFamily: 'Cocogoose', fontWeight: FontWeight.w200),
          ),
          backgroundColor: mainColorLighter,
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
              child: Container(
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: <Widget>[
                Container(
                    height: 110,
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                          '${this.sector.toUpperCase()}',
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: mainColorLighter,
                                              fontSize: 15.0,
                                              fontFamily: 'Cocogoose',
                                              fontWeight: FontWeight.w300))),
                                  Container(
                                    padding: EdgeInsets.only(),
                                    child: Text(
                                      '${this.price} COP',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[500],
                                      ),
                                      Text(this.rating,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          )),
                                    ]),
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.center,
                              height: 220,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(img), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ])),
                Divider(height: 10.0, thickness: 2),
                Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Entrada',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cocogoose',
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${input.day}/',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: mainColorLighter),
                                        ),
                                        Text('${this.monthsName[input.month]}',
                                            style: TextStyle(
                                                fontFamily: 'Cocogoose',
                                                color: mainColorLighter))
                                      ]),
                                  Text(
                                    input.year.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  )
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Salida',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cocogoose',
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${output.day}/',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: mainColorLighter),
                                        ),
                                        Text('${this.monthsName[output.month]}',
                                            style: TextStyle(
                                                fontFamily: 'Cocogoose',
                                                color: mainColorLighter))
                                      ]),
                                  Text(output.year.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.6)))
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.date_range,
                                    size: 35,
                                    color: Color.fromRGBO(0, 0, 0, 0.5)),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${output.difference(input).inDays.toString()} ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text('días',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Cocogoose',
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.6)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Divider(height: 10.0, thickness: 2),
                Container(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${output.difference(input).inDays.toString()} X (${this.price})',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                fontSize: 15),
                          ),
                          Text('${output.difference(input).inDays * price}',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15))
                        ]),
                    SizedBox(height: 15.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Otros servicios',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cocogoose',
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                          Text('0.0',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15)),
                        ]),
                    SizedBox(height: 12.0),
                  ],
                )),
                Divider(height: 10.0, thickness: 2),
                SizedBox(height: 12.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total (COP)',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cocogoose',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                      Text('${output.difference(input).inDays * price}',
                          style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.bold))
                    ])
              ],
            ),
          )),
          Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: RaisedButton(
                color: mainColorLighter,
                child: Text(
                  'RESERVAR',
                  style: TextStyle(
                      fontFamily: 'Cocogoose',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () async {
                  _onBooking(context, booking, dates);
                },
              ))
        ])));
  }
}
