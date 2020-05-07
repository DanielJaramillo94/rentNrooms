import 'package:flutter/foundation.dart';
import 'package:rent_n_rooms/models/date_picker.model.dart';

class DateProvider with ChangeNotifier {
  
  DatePicker datePicker = DatePicker(DateTime.now(), DateTime.now().add(Duration(days: 7)));
  
    void updateDate(DateTime checkin, DateTime checkout){
      datePicker.setChecin(checkin);
      datePicker.setCheckout(checkout);
      notifyListeners();
      print("Actualización");
      print(datePicker);
    }
  
    DatePicker getDates(){
      return datePicker;
    }

    int difference(){
      var dateLast = datePicker.getDateCheckout();
      var dateFirst = datePicker.getDateCheckin();
      return dateLast.difference(dateFirst).inDays;
    }
  

}