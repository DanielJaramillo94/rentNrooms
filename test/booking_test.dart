import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/auth.service.dart';
import 'package:rent_n_rooms/booking/booking.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

class RouteGenerator2 {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/booking':
        return MaterialPageRoute(builder: (_) => Booking(settings.arguments));
        break;
      default:
        return MaterialPageRoute(builder: (_) => Booking(settings.arguments));
    }
  }
}

void main() {
  Widget makeTesteableWidget(String before, String idBooking) {
    BookingProvider mockBooking = BookingProvider();
    DateProvider mockDate = DateProvider();
    PlaceProvider mockPlace = PlaceProvider();

    mockDate.getDates().setChecin(DateTime.now());
    mockDate.getDates().setCheckout(DateTime.now().add(Duration(days: 5)));

    mockBooking.getBooking().setIdBooking(idBooking);
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
        "https://www.sphereinc.com/wp-content/uploads/2019/03/Three-Options-and-Tips-for-Creating-a-Python-AWS-Lambda-Function.png"));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookingProvider>.value(
          value: mockBooking,
        ),
        ChangeNotifierProvider<DateProvider>.value(
          value: mockDate,
        ),
        ChangeNotifierProvider<PlaceProvider>.value(
          value: mockPlace,
        ),
        Provider<AuthService>(create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        key: Key('keyy'),
        debugShowCheckedModeBanner: false,
        title: 'Rent & Rooms',
        initialRoute: '/booking',
        onGenerateRoute: RouteGenerator2.generateRoute,
      ),
    );
  }

  testWidgets('Show button "Reservar" when there are not booking',
      (WidgetTester tester) async {
        provideMockedNetworkImages(() async {
    await tester.pumpWidget(makeTesteableWidget('place_details', ''));
    expect(find.byKey(Key('doBooking')), findsOneWidget);
    expect(find.byKey(Key('container_idBooking')), findsNothing);
        });
  });

  testWidgets('Not show button "Reservar and show Id booking"',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTesteableWidget('place_details', '23'));
    expect(find.byKey(Key('doBooking')), findsNothing);
    expect(find.byKey(Key('container_idBooking')), findsOneWidget);
    expect(find.text('23'), findsOneWidget);
  });

  testWidgets('back details', (WidgetTester tester) async {
    await tester.pumpWidget(makeTesteableWidget('place_details', ''));
    final buttonBack = find.byKey(Key('button_back'));
    tester.tap(buttonBack);
  });

  testWidgets('total price is \$500,000', (WidgetTester tester) async {
    await tester.pumpWidget(makeTesteableWidget('place_details', ''));
    expect(find.text('\$100,000 COP'), findsOneWidget);
    expect(find.text('\$500,000'), findsWidgets);

  });

}
