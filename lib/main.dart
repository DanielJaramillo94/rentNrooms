import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rent_n_rooms/date.dart';

void main() => runApp(MyApp());

Color mainColor = Color(0xFF006BB1);
Color mainColorMiddle = Color(0xFF2195C6);
Color mainColorLighter = Color(0xFF42BEBD);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent & Rooms',
      theme: ThemeData(
          // primarySwatch: Colors.blue, ⚠️⚠️
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                        fontSize: 20.0, color: Colors.white),
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
                                        style: TextStyle(
                                            fontFamily: 'Cocogoose',
                                            fontSize: 16.0),
                                        cursorColor: Colors.black38,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 6),
                                            hintText: 'Ciudad, Ubicación',
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
                                                          delegate: DataSearch());
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
                    child: Text('Encuentra un lugar para tu estadía'),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: mainColorMiddle,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('NUEVO',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(6, (index) {
              const radius = 8.0;
              const apartments = [
                //⚠️⚠️THIS IS JUST FOR TESTING PURPOSES⚠️⚠️
                'assets/images/apartment1.jpg',
                'assets/images/apartment2.jpg',
                'assets/images/apartment3.jpg',
              ];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(apartments[index % 3]),
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
                        padding: const EdgeInsets.all(radius + 3),
                        child: Text(
                          'Poblado, Medellín',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
      drawer: Drawer(),
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

class DataSearch extends SearchDelegate<String> {
  final citiesSearch = [
    'Bogotá',
    'Medellín',
    'Cali',
    'Barranquilla',
    'Cartagena',
    'Cúcuta',
    'Soledad',
    'Ibagué'
  ];

  final popularCities = ['Bogotá', 'Medellín', 'Cali', 'Cartagena'];



  @override
  Widget buildResults(BuildContext context) {
    return Card(
        child: Center(
          child: Text(query, style: TextStyle(fontFamily: 'Cocogoose')),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? popularCities
        : citiesSearch.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.location_on),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  fontFamily: 'Cocogoose',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }
}
