import 'package:flutter_test/flutter_test.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';
import 'package:rent_n_rooms/providers/date_picker.provider.dart';

void main() {
  test('Update date', () {
    var moonLanding = DateTime.parse("2020-07-20 20:18:04Z");
    DateProvider dateprov = DateProvider();
    dateprov.updateDate(moonLanding, moonLanding.add(Duration(days: 2)));
    expect(dateprov.getDates().getDateCheckin(), moonLanding);
    expect(dateprov.getDates().getDateCheckout(),
        moonLanding.add(Duration(days: 2)));
  });

  test('Get date', () {
    DateProvider dateprov = DateProvider();
    DatePicker datePicker =
        DatePicker(DateTime.now(), DateTime.now().add(Duration(days: 7)));
    dateprov.updateDate(DateTime.now(), DateTime.now().add(Duration(days: 7)));
    identical(dateprov.getDates(), datePicker);
  });

  test('Days difference', () {
    DateProvider dateprov = DateProvider();
    dateprov.updateDate(DateTime.now(), DateTime.now().add(Duration(days: 7)));
    identical(
        (dateprov.getDates().getDateCheckout())
            .difference(dateprov.getDates().getDateCheckin())
            .inDays,
        7);
  });
}
