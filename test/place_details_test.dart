import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';
import 'package:rent_n_rooms/place_details.dart';

class RouteGenerator2 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/place_details':
        return MaterialPageRoute(
            builder: (_) => PlaceDetails(settings.arguments));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => PlaceDetails(settings.arguments));
    }
  }
}

void main() {
  Widget makeTesteableWidget(String before, String idRoom) {
    PlaceProvider mockPlace = PlaceProvider();

    mockPlace.setIdRoom(idRoom);
    mockPlace.setRoom(Place(
        'https://cdn.pixabay.com/photo/2016/11/22/19/11/brick-wall-1850095_960_720.jpg',
        "_placeName",
        "_location",
        100000,
        "_description",
        5,
        ['internet'],
        "_idRoom",
        "_agency",
        "https://www.sphereinc.com/wp-content/uploads/2019/03/Three-Options-and-Tips-for-Creating-a-Python-AWS-Lambda-Function.png",
        [
          'https://cdn.pixabay.com/photo/2016/11/22/19/11/brick-wall-1850095_960_720.jpg',
          'https://cdn.pixabay.com/photo/2016/11/22/19/11/brick-wall-1850095_960_720.jpg'
        ]));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlaceProvider>.value(
          value: mockPlace,
        )
      ],
      child: MaterialApp(
        key: Key('keyy'),
        debugShowCheckedModeBanner: false,
        title: 'Rent & Rooms',
        initialRoute: '/place_details',
        onGenerateRoute: RouteGenerator2.generateRoute,
      ),
    );
  }

  testWidgets('Show button "Continuar"', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpWidget(makeTesteableWidget('/result_cards', ''));
      expect(find.byType(RaisedButton), findsOneWidget);
    });
  });
}
/* 
testWidgets('Button is present and triggers navigation after tapped',     
  (WidgetTester tester) async {     
    await tester.pumpWidget(MaterialApp(PlaceDetails(mockpl)));     
  expect(find.byType(RaisedButton), findsOneWidget);    
   await tester.tap(find.byType(RaisedButton));     //how to test navigator?       }); */