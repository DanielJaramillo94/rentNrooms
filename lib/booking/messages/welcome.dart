import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {

  const WelcomeMessage();

  static Color mainColor = Color(0xFF006BB1);
  static Color mainColorMiddle = Color(0xFF2195C6);
  static Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("¡Bienvenido!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mainColorLighter,
                  fontFamily: 'Cocogoose',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700)),
          Column(children: <Widget>[
            Text('Termina tu reserva...',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w200,
                    color: Color.fromRGBO(0, 0, 0, 0.6))),
          ]),
          Icon(Icons.book, size: 60, color: mainColorLighter),
        ]);
  }
}
