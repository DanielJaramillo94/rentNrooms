import 'package:flutter/material.dart';

class ResultCard extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultados',
          style: TextStyle(fontFamily: 'Cocogoose'),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                const radius = 8.0;
                const apartments = [
                  //⚠️⚠️THIS IS JUST FOR TESTING PURPOSES⚠️⚠️
                  'assets/images/apartment1.jpg',
                  'assets/images/apartment2.jpg',
                  'assets/images/apartment3.jpg',
                ];
                const details = [
                  {
                    "agency": {
                      "id": "1",
                      "logo_url": "https://cutt.ly/myjquBa",
                      "name": "S_TEAM"
                    },
                    "currency": "COP",
                    "id": "1",
                    "location": {
                      "code": "MDE",
                      "latitude": "6.2518401",
                      "longitude": "-75.563591",
                      "name": "Medellin"
                    },
                    "price": 350000.0,
                    "property_name": "Apartamento en El poblado",
                    "rating": "5.0",
                    "thumbnail": null
                  },
                  {
                    "agency": {
                      "id": "1",
                      "logo_url": "https://cutt.ly/myjquBa",
                      "name": "S_TEAM"
                    },
                    "currency": "COP",
                    "id": "2",
                    "location": {
                      "code": "MDE",
                      "latitude": "6.2518401",
                      "longitude": "-75.563591",
                      "name": "Medellin"
                    },
                    "price": 80000.0,
                    "property_name": "Torres de bombona",
                    "rating": "5.0",
                    "thumbnail": null
                  },
                  {
                    "agency": {
                      "id": "1",
                      "logo_url": "https://cutt.ly/myjquBa",
                      "name": "S_TEAM"
                    },
                    "currency": "COP",
                    "id": "3",
                    "location": {
                      "code": "MDE",
                      "latitude": "6.2518401",
                      "longitude": "-75.563591",
                      "name": "Medellin"
                    },
                    "price": 340000.0,
                    "property_name": "Apartamento en el Estadio",
                    "rating": "4.0",
                    "thumbnail": null
                  }
                ];
                String price = details[index]["price"].toString();
                //String city = details[index]["location"][name];
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 220,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(apartments[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(radius)),
                      ),
                      Container(
                        child: Row(children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow[500],
                          ),
                          Text(details[index]["rating"],
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
                                Text(details[index]["property_name"],
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Cocogoose')),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text("Medellin",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Cocogoose',
                                  )
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        child: Row(children: <Widget>[
                          Text("\$$price por noche",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ],
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    ); //Scaffold
  }
}
