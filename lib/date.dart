import 'dart:math';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/waveClippert.dart';

import 'models/date_picker.model.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  
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
        initialLastDate: 
          _dateLast == null ? DateTime.now().add(Duration(days: 7)) : _dateLast,
         firstDate: new DateTime(DateTime.now().year),
        lastDate: new DateTime(DateTime.now().year + 1),
    );
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
    final dates = Provider.of<DateProvider>(context);
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
                  flex: 8,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 110,
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
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 32.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Text('Fecha de entrada:', style: TextStyle(fontSize: 17.0, fontFamily: 'Cocogoose', color: Color.fromRGBO(0, 0, 0, 0.6))),
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
                                        onTap:  () async{
                                           final List<DateTime> picked = await DateRagePicker.showDatePicker(
                                              context: context,
                                              initialFirstDate: _dateFirst == null ? DateTime.now() : dates.getDates().getDateCheckin(),
                                              initialLastDate: 
                                                _dateLast == null ? DateTime.now().add(Duration(days: 7)) : dates.getDates().getDateCheckout(),
                                                firstDate: new DateTime(DateTime.now().year),
                                              lastDate: new DateTime(DateTime.now().year + 1),
                                          );
                                          if (picked != null && picked.length == 2) {
                                            dates.updateDate(picked[0], picked[1]);
                                          }                                          
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.date_range),
                                            hintText:
                                                "${dates.getDates().getDateCheckin().day.toString()}/${dates.getDates().getDateCheckin().month.toString()}/${dates.getDates().getDateCheckin().year.toString()}",
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
                                child: Text('Fecha de salida:', style: TextStyle(fontSize: 17.0, fontFamily: 'Cocogoose', color: Color.fromRGBO(0, 0, 0, 0.6),),),
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
                                        onTap: () async{
                                           final List<DateTime> picked = await DateRagePicker.showDatePicker(
                                              context: context,
                                              initialFirstDate: _dateFirst == null ? DateTime.now() : dates.getDates().getDateCheckin(),
                                              initialLastDate: 
                                                _dateLast == null ? DateTime.now().add(Duration(days: 7)) : dates.getDates().getDateCheckout(),
                                                firstDate: new DateTime(DateTime.now().year),
                                              lastDate: new DateTime(DateTime.now().year + 1),
                                          );
                                          if (picked != null && picked.length == 2) {
                                            dates.updateDate(picked[0], picked[1]);
                                          }                                          
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.date_range),
                                            hintText:
                                                "${dates.getDates().getDateCheckout().day.toString()}/${dates.getDates().getDateCheckout().month.toString()}/${dates.getDates().getDateCheckout().year.toString()}",
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
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Transform.rotate(
                      angle: pi,
                      child: Container(
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
                ),
              ]),
        ),
      ),
    );
  }
}

