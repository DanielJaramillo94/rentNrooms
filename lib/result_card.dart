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
  @override
  Widget build(BuildContext context) {
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
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var searchCardsProv = Provider.of<SearchCardProvider>(context);
                Future<List<SearchCard>> searchCards =
                    searchCardsProv.getSearchCards();
                return FutureBuilder<List<SearchCard>>(
                  future: searchCards,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String price = searchCardsProv
                          .formatPrice(snapshot.data[index].getPrice());
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SearchCardBuilder(
                              imgURL: snapshot.data[index].getImgUrl(),
                              location: snapshot.data[index].getLocation(),
                              rating: snapshot.data[index].getRating(),
                              placeName: snapshot.data[index].getProperty(),
                              price: price),
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
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
