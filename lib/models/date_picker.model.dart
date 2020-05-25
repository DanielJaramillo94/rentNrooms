class DatePicker {
  DateTime checkin;
  DateTime checkout;

  DatePicker (this.checkin, this.checkout);

  DateTime getDateCheckin() {
    return this.checkin;
  }

  DateTime getDateCheckout() {
    return this.checkout;
  }

  void setCheckout(DateTime checkout){
    this.checkout = checkout;
  }

  void setChecin(DateTime checkin){
    this.checkin = checkin;
  }

  String checkinYYYYMMDD(){
    return this._dateToYYYMMDDFormat(checkin);
  }

  String checkoutYYYYMMDD(){
    return this._dateToYYYMMDDFormat(checkin);
  }

  String _dateToYYYMMDDFormat(DateTime date){
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    return '$year-$month-$day';
  }
}