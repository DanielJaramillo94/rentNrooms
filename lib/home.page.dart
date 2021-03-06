import 'package:flutter/material.dart';
import 'package:rent_n_rooms/dataSearch.dart';
import 'package:rent_n_rooms/home_card.dart';

import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/city.model.dart';
import 'package:rent_n_rooms/models/home_card.model.dart';
import 'package:rent_n_rooms/providers/city.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/providers/home_cards.provider.dart';

import 'main_drawer.dart';
import 'myFadeLogo.dart';

Color mainColor = Color(0xFF006BB1);
Color mainColorMiddle = Color(0xFF2195C6);
Color mainColorLighter = Color(0xFF42BEBD);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [mainColorLighter, mainColor],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Alojamientos con\n reserva flexible',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white, fontFamily: 'Cocogoose'),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    width: 280,
                                    height: 40,
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      child: TextField(
                                        showCursor: false,
                                        readOnly: true,
                                        style: TextStyle(
                                            fontFamily: 'Cocogoose',
                                            fontSize: 16.0),
                                        cursorColor: Colors.black38,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 6),
                                            hintText: 'Ciudad',
                                            hintStyle: TextStyle(
                                                fontFamily: 'Cocogoose',
                                                color: Colors.black),
                                            border: InputBorder.none,
                                            suffixIcon: Material(
                                                elevation: 2,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: IconButton(
                                                    icon: Icon(Icons.search),
                                                    onPressed: () {
                                                      showSearch(
                                                          context: context,
                                                          delegate:
                                                              DataSearch());
                                                    }))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 20,
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white, size: 27),
                      onPressed: () => scaffoldKey.currentState.openDrawer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Encuentra un lugar para tu estadía', style: TextStyle(
                        color: Color.fromRGBO(77, 77, 77, 1),
                        fontSize: 15.0,
                        fontFamily: 'Cocogoose',
                        fontWeight: FontWeight.w300),),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: mainColorMiddle,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('NUEVO',
                            style: TextStyle(color: Colors.white, fontFamily: 'Cocogoose')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(4, (index) {
              var homeCardsProv = Provider.of<HomeCardsProvider>(context);
              Future<List<HomeCard>> homeCards = homeCardsProv.getHomeCards();
              return FutureBuilder<List<HomeCard>>(
                future: homeCards,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: HomeCardBuilder(
                          imgURL: snapshot.data[index % 4].getImgUrl(),
                          location: snapshot.data[index % 4].getLocation(),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: MyFadeLogo(),
                      ),
                    );
                  }
                },
              );
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height - 40);

    var point1 = Offset(size.width * 0.5, size.height - 40);
    var point1Control = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(
        point1Control.dx, point1Control.dy, point1.dx, point1.dy);

    var point2 = Offset(size.width, size.height - 20);
    var point2Control = Offset(size.width * 0.75, size.height - 80);
    path.quadraticBezierTo(
        point2Control.dx, point2Control.dy, point2.dx, point2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

void datePicker(DateProvider dates) async {
  DateTime now = new DateTime.now();

  DateTime firstDate = new DateTime(
      now.year, now.month, now.day, now.hour, now.minute, now.second);
  DateTime lastDate = new DateTime(
      now.year + 1, now.month, now.day, now.hour, now.minute, now.second);

  dates.updateDate(firstDate, lastDate);
}
