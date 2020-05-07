import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      image: DecorationImage(
                          image: AssetImage('assets/images/apartment2.jpg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Pásela rico, rico, pero muy rico Resorts SAS',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Cocogoose',
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Poblado, Medellín',
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
                            '\$950',
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
                Rating(),
                SizedBox(height: 15),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Vivamus efficitur mollis quam at accumsan. Aliquam lacus nisl, ornare et quam ac, interdum aliquet lectus. Proin semper fringilla cursus. Phasellus a risus sit amet quam laoreet cursus. Etiam consectetur dictum leo, sed pharetra felis sodales a. Integer pellentesque neque sed justo gravida, at ullamcorper libero convallis. Maecenas luctus venenatis.',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        'Vivamus efficitur mollis quam at accumsan. Aliquam lacus nisl, ornare et quam ac, interdum aliquet lectus. Proin semper fringilla cursus. Phasellus a risus sit amet quam laoreet cursus. Etiam consectetur dictum leo, sed pharetra felis sodales a. Integer pellentesque neque sed justo gravida, at ullamcorper libero convallis. Maecenas luctus venenatis.',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                    ),
                  ],
                ),
                Divider(height: 10.0, thickness: 2),
                ServicesWidget(),
                Divider(height: 10.0, thickness: 2),
                SizedBox(height: 12.0),
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
                      onPressed: () {},
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow[500],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow[500],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow[500],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow[500],
        ),
        Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow[500],
        ),
      ],
    );
  }
}

class ServicesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.wifi,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'wi-fi',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.ac_unit,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'aire',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.local_parking,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'parking',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.kitchen,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'cocina',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.pool,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'piscina',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.fitness_center,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                    ),
                  ),
                ),
              ),
              Text(
                'gimnasio',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Cocogoose',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
