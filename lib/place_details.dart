import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rent_n_rooms/error.page.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';
import 'package:rent_n_rooms/rating.builder.dart';
import 'package:rent_n_rooms/services.builder.dart';

class PlaceDetails extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  final placeName;

  PlaceDetails(this.placeName);

  @override
  Widget build(BuildContext context) {
    var placeProv = Provider.of<PlaceProvider>(context);
    String agencyName = placeProv.getAgency();
    String idRoom = placeProv.getIdRoom();
    Future<Place> place = placeProv.fetchRoom(agencyName, idRoom);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.placeName,
          style:
              TextStyle(fontFamily: 'Cocogoose', fontWeight: FontWeight.w200),
        ),
        backgroundColor: mainColorLighter,
      ),
      body: FutureBuilder<Place>(
        future: place,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.getPlaceName() == 'error') {
            return ErrorPage();
          }
          else if (snapshot.hasData) {
            String price = placeProv.formatPrice(snapshot.data.getNightPrice());
            return SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          images: snapshot.data.getPhotos().map((imgURL) => NetworkImage(imgURL)).toList(),
                          dotSize: 6.0,
                          autoplay: false,
                          indicatorBgPadding: 10.0,
                          dotIncreasedColor: mainColorLighter,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 1000),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    snapshot.data.getPlaceName(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Cocogoose',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    snapshot.data.getLocation(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Cocogoose',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '\$$price',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 0, 0, 0.6)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'por noche',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: 'Cocogoose',
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      RatingBuilder(rating: snapshot.data.getRating()),
                      SizedBox(height: 15),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              snapshot.data.getDescription(),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 10.0, thickness: 2),
                      ServicesBuilder(
                          servicesList: snapshot.data.getServices()),
                      Divider(height: 10.0, thickness: 2),
                      SizedBox(height: 12.0),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('Agencia a cargo: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Cocogoose',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.5))),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 70,
                                  width: 70,
                                  child: Column(children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        child: Image(
                                          image: NetworkImage(
                                              snapshot.data.getLogo()),
                                        )),
                                  ]),
                                ),
                                Expanded(
                                  child: Text(snapshot.data.getAgency(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Cocogoose',
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromRGBO(0, 0, 0, 0.4))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: RaisedButton(
                            color: mainColorLighter,
                            child: Text(
                              'Continuar',
                              style: TextStyle(
                                  fontFamily: 'Cocogoose',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/booking', arguments: 'place_details');
                            },
                          ))
                    ],
                  )),
                ],
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
