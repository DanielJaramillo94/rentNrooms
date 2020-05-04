import 'package:flutter/material.dart';

class HomeCardBuilder extends StatelessWidget {

  HomeCardBuilder({Key key, @required this.imgURL, @required this.location}) : super(key: key);

  final imgURL;
  final location;
  final radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage(imgURL),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(radius)),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xAAFFFFFF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(11),
          child: Text(
            location,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}