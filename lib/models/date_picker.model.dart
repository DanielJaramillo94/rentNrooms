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

  void setCheckout(DateTime checkout) {
    this.checkout = checkout;
  }

  void setChecin(DateTime checkin) {
    this.checkin = checkin;
  }

  String checkinYYYYMMDD() {
    return this._dateToYYYMMDDFormat(checkin);
  }

  String checkoutYYYYMMDD() {
    return this._dateToYYYMMDDFormat(checkout);
  }

  String _dateToYYYMMDDFormat(DateTime date) {
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    return '$year-$month-$day';
  }

  String getCheckingString() {
    String checkin = this.checkin.toString().split(" ")[0];
    return checkin;
  }

    String getCheckoutString() {
    String checkout = this.checkout.toString().split(" ")[0];
    return checkout;
  }

}
