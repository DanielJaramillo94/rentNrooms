import 'dart:math';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime _dateTime;
  final String _city = "Medellín";

  DateTime _dateFirst = DateTime.now();
  DateTime _dateLast = DateTime.now().add(Duration(days: 7));
  String _days = "7";

  final myController = TextEditingController();

  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  void datePicker() async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _dateFirst == null ? DateTime.now() : _dateFirst,
        initialLastDate: _dateLast == null
            ? DateTime.now().add(Duration(days: 7))
            : _dateLast,
        firstDate: new DateTime(2014),
        lastDate: new DateTime(2025));
    if (picked != null && picked.length == 2) {
      print(picked);
      setState(() {
        _dateFirst = picked[0];
        _dateLast = picked[1];
        _days = _dateLast.difference(_dateFirst).inDays.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Fecha', style: TextStyle(fontFamily: 'Cocogoose'),),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 20.0, bottom: 20.0, top: 10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(children: <Widget>[
                                  Text("Habitaciones en ",
                                      style: TextStyle(fontSize: 20.0, fontFamily: 'Cocogoose')),
                                  Text(
                                    _city,
                                    style: TextStyle(fontSize: 27.0, fontFamily: 'Cocogoose', color: Color.fromRGBO(66, 190, 219, 1)),
                                  ),
                                ]),
                              ),
                              Container(
                                child: Row(children: <Widget>[
                                  Text("por ",
                                      style: TextStyle(fontSize: 20.0, fontFamily: 'Cocogoose')),
                                  Text(
                                    _days,
                                    style: TextStyle(fontSize: 27.0, color: Color.fromRGBO(66, 190, 219, 1)),
                                  ),
                                  Text(" días. ",
                                      style: TextStyle(fontSize: 20.0, fontFamily: 'Cocogoose'))
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 32.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Text(
                                    _dateTime == null
                                        ? 'Fecha de entrada:'
                                        : _dateTime.toString(),
                                    style: TextStyle(fontSize: 17.0, fontFamily: 'Cocogoose', color: Color.fromRGBO(0, 0, 0, 0.6))),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 32.0, top: 8.0),
                                child: new Row(
                                  children: <Widget>[
                                    Container(
                                      child: new Flexible(
                                          child: new TextField(
                                        readOnly: true,
                                        onTap: datePicker,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.date_range),
                                            hintText:
                                                "${_dateFirst.day.toString()}/${_dateFirst.month.toString()}/${_dateFirst.year.toString()}",
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 10.0, 10.0, 10.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0))),
                                        maxLines: 1,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 32.0,
                                    top: 25.0,
                                    bottom: 8.0),
                                child: Text(
                                    _dateTime == null
                                        ? 'Fecha de salida:'
                                        : _dateTime.toString(),
                                    style: TextStyle(fontSize: 17.0, fontFamily: 'Cocogoose', color: Color.fromRGBO(0, 0, 0, 0.6),),),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: 32.0, top: 8.0),
                                child: new Row(
                                  children: <Widget>[
                                    Container(
                                      child: new Flexible(
                                          child: new TextField(
                                        readOnly: true,
                                        enableInteractiveSelection: false,
                                        onTap: datePicker,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.date_range),
                                            hintText:
                                                "${_dateLast.day.toString()}/${_dateLast.month.toString()}/${_dateLast.year.toString()}",
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 10.0, 10.0, 10.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0))),
                                        maxLines: 1,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: RaisedButton.icon(
                            color: Colors.white,
                            icon: Icon(Icons.search),
                            onPressed: () {
                              print("Buscando...");
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: mainColorMiddle),
                              borderRadius: new BorderRadius.circular(18.0),
                            ),
                            label: Text(
                              "Buscar",
                              style: TextStyle(fontSize: 17.0,  fontFamily: 'Cocogoose'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Transform.rotate(
                    angle: pi,
                    child: Container(
                      height: 160.0,
                      child: Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: WaveClipper(),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [mainColorLighter, mainColor],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height - 40);

    var point1 = Offset(size.width * 0.5, size.height - 40);
    var point1Control = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(
        point1Control.dx, point1Control.dy, point1.dx, point1.dy);

    var point2 = Offset(size.width, size.height - 20);
    var point2Control = Offset(size.width * 0.75, size.height - 80);
    path.quadraticBezierTo(
        point2Control.dx, point2Control.dy, point2.dx, point2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
