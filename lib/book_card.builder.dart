import 'package:flutter/material.dart';

class BookingCardBuilder extends StatelessWidget {
  BookingCardBuilder({
    Key key,
  }) : super(key: key);

  final double radius = 8.0;

  @override
  Widget build(BuildContext context) {
    String thumbnailUrl =
        'https://indaily.com.au/wp-content/uploads/2019/04/Screen-Shot-2019-04-12-at-8.04.06-am-850x455.png';
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 5,
      child: InkWell(
        onTap: () {
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnailUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(radius)),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              'PlaceName That is quite long',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Cocogoose',
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Medellín',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Cocogoose',
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Entrada: 2020-05-06',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Salida: 2020-05-10',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '\$500',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
