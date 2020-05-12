import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {

  final String idBooking;
  const SuccessMessage(this.idBooking );

  static Color mainColor = Color(0xFF006BB1);
  static Color mainColorMiddle = Color(0xFF2195C6);
  static Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("¡Tú reserva fue exitosa!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mainColorLighter,
                  fontFamily: 'Cocogoose',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700)),
          Column(children: <Widget>[
            Text('El código de tú reserva es: ',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(0, 0, 0, 0.6))),
            Text(
              '${this.idBooking}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
          Icon(Icons.done_all, size: 60, color: mainColorLighter),
          Text('¡Disfruta tu estancia!',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Cocogoose',
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(0, 0, 0, 0.6)))
        ]);
  }
}
