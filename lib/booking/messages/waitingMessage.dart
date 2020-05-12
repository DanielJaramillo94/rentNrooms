import 'package:flutter/material.dart';

class WaitingMessage extends StatelessWidget {
  const WaitingMessage();

  static Color mainColor = Color(0xFF006BB1);
  static Color mainColorMiddle = Color(0xFF2195C6);
  static Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(children: <Widget>[
        Text(
          'Realizando reserva...',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Cocogoose',
              fontSize: 20.0,
              color: Color.fromRGBO(0, 0, 0, 0.6),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20.0),
        Container(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(mainColorLighter),
            ))
      ]),
    );
  }
}
