import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/models/bookingg.model.dart';
import 'package:rent_n_rooms/models/place.model.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

class BookingCardBuilder extends StatelessWidget {
  BookingCardBuilder({
    Key key,
    @required this.booking,
  }) : super(key: key);

  final Bookingg booking;
  final double radius = 8.0;
  final formatter = new NumberFormat.simpleCurrency(decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 5,
      child: InkWell(
        onTap: () async {
          final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
          bookingProvider.updateBooking('Daniel', 'Jaramillo', booking.getIdRoom(), booking.getIdBooking());

          final datesProvider = Provider.of<DateProvider>(context, listen: false);
          DateTime checkin = DateTime.parse(booking.getCheckin());
          DateTime checkout = DateTime.parse(booking.getCheckout());
          datesProvider.updateDate(checkin, checkout);

          final roomProvider = Provider.of<PlaceProvider>(context, listen: false);
          Place room = await roomProvider.fetchRoom(booking.getAgency(), booking.getIdRoom());
          roomProvider.setRoom(room);

          Navigator.of(context).pushNamed('/booking', arguments: 'bookings_list');
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image(
                       image: AssetImage('assets/images/LogotipoGray.png'),
   
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(booking.getThumbnail()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(radius)),
                  )
                ],
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
                              booking.getRoomName(),
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
                              booking.getLocation(),
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
                              'Entrada: ${booking.getCheckin()}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Salida: ${booking.getCheckout()}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromRGBO(0, 0, 0, 0.6)),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${formatter.format(booking.getPrice())}',
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
