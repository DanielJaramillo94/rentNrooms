import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:rent_n_rooms/search_card.dart';
import 'package:rent_n_rooms/providers/search_card.provider.dart';
import 'package:rent_n_rooms/models/search_card.model.dart';

class ResultCard extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<ResultCard> {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    final searchCardsProv = Provider.of<SearchCardProvider>(context);
    Future<int> cant = searchCardsProv.getNumberCards();
    Future<List<SearchCard>> searchCards = searchCardsProv.getSearchCards();
    return FutureBuilder(
        future: Future.wait([searchCards, cant]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshots) {
          var snapshot = snapshots.data[0];
          var numberCards = snapshots.data[1];
          if (snapshot.length != 0) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                ),
                title: Text(
                  'Resultados',
                  style: TextStyle(fontFamily: 'Cocogoose'),
                ),
                backgroundColor: mainColorLighter,
              ),
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      String price = searchCardsProv
                          .formatPrice(snapshot[index].getPrice());
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SearchCardBuilder(
                              imgURL: snapshot[index].getImgUrl(),
                              location: snapshot[index].getLocation(),
                              rating: snapshot[index].getRating(),
                              placeName: snapshot[index].getProperty(),
                              price: price,
                              idRoom: snapshot[index].getIdRoom(),
                              agency: snapshot[index].getAgency(),),

                        ),
                      );
                      /*} else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }*/
                    },
                    childCount: numberCards,
                  )
                      //print(cant);

                      ),
                ],
              ),
            );
          } else {
            return Text('quiero mimir');
          }
        });
  }
}
