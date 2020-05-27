import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/place.model.dart';
import 'providers/place.provider.dart';

class SearchCardBuilder extends StatelessWidget {
  SearchCardBuilder({
    Key key,
    @required this.imgURL,
    @required this.location,
    @required this.rating,
    @required this.placeName,
    @required this.price,
    @required this.idRoom,
    @required this.agency
  }) : super(key: key);

  final String imgURL;
  final String location;
  final double rating;
  final String placeName;
  final double price;
  final double radius = 8.0;
  final String idRoom;
  final String agency;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/place_details', arguments: placeName);
        },
        child: Container(
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.place,
                                size: 16,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                              Text(
                                location,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Cocogoose',
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow[500],
                              size: 19,
                            ),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        placeName,
                        // textAlign: TextAlign.end,
                        // maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cocogoose',
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Agencia: $agency',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\$$price por noche',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
