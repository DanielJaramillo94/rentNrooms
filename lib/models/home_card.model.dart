class HomeCard {
  final String imgURL;
  final String location;

  HomeCard(this.imgURL, this.location);

  String getImgUrl() {
    return this.imgURL;
  }

  String getLocation() {
    return this.location;
  }
}