import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Ooops.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Cocogoose',
                  color: Color.fromRGBO(0, 0, 0, 0.6))),
          Text('Hubo un error, por favor inténtelo más tarde.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17.0,
                  fontFamily: 'Cocogoose',
                  color: Color.fromRGBO(0, 0, 0, 0.6))),
        ],
      ),
    );
  }
}
