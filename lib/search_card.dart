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
    return Material(
      elevation: 5,
      child: InkWell(
        onTap: () {
          print('OnTap SearchCard :)');
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
                              rating,
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
                        property,
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
