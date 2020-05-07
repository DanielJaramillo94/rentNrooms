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
}