import 'dart:math';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime _dateTime;

  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_dateTime == null
                          ? 'Nothing has been picked yet'
                          : _dateTime.toString()),
                      RaisedButton(
                        child: Text('Pick a date'),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2021))
                              .then((datepick) {
                            print(datepick);
                            setState(() {
                              _dateTime = datepick;
                            });
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_dateTime == null
                          ? 'Nothing has been picked yet'
                          : _dateTime.toString()),
                      RaisedButton(
                          color: mainColor,
                          onPressed: () async {
                            final List<DateTime> picked =
                                await DateRagePicker.showDatePicker(
                                    context: context,
                                    initialFirstDate: DateTime(2014),
                                    initialLastDate: DateTime(2014),
                                    firstDate: new DateTime(2014),
                                    lastDate: new DateTime(2025));
                            if (picked != null && picked.length == 2) {
                              print(picked);
                            }
                          },
                          child: new Text("Pick date range"))
                    ],
                  ),
                ),
                Container(
                  child: Transform.rotate(
                    angle: pi,
                    child: Container(
                      height: 110.0,
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
