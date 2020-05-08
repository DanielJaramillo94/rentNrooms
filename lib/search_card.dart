import 'package:flutter/material.dart';

class SearchCardBuilder extends StatelessWidget {
  SearchCardBuilder(
      {Key key,
      @required this.imgURL,
      @required this.location,
      @required this.rating,
      @required this.property,
      @required this.price})
      : super(key: key);

  final String imgURL;
  final String location;
  final String rating;
  final String property;
  final String price;
  final double radius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgURL), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(radius)),
          ),
          Container(
            child: Row(children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow[500],
              ),
              Text(rating,
                  style: TextStyle(
                    fontSize: 14.0,
                  )),
            ]),
          ),
          Container(
            child: Column(children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text(property,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16.0, fontFamily: 'Cocogoose')),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(location,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Cocogoose',
                        )),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            child: Row(children: <Widget>[
              Text('\$$price por noche',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ]),
          ),
        ],
      ),
    );
  }
}
