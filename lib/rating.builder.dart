import 'package:flutter/material.dart';

class RatingBuilder extends StatelessWidget {
  RatingBuilder({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getRatingWidgetsList(rating)
    );
  }
}

List<Widget> getRatingWidgetsList(double rating) {
  List<Widget> ratingListWidgets = new List();

  int fullStars = rating.floor();
  int halfStars = (rating-fullStars)>=0.5 ? 1 : 0;
  int emptyStars = 5-halfStars-fullStars;

  for (var i = 0; i < fullStars; i++) {
    ratingListWidgets.add(StartIcon());
  }
  for (var i = 0; i < halfStars; i++) {
    ratingListWidgets.add(HalfStartIcon());
  }
  for (var i = 0; i < emptyStars; i++) {
    ratingListWidgets.add(EmptyStartIcon());
  }

  return ratingListWidgets;
}

class StartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 20,
      color: Colors.yellow[500],
    );
  }
}

class HalfStartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_half,
      size: 20,
      color: Colors.yellow[500],
    );
  }
}

class EmptyStartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_border,
      size: 20,
      color: Colors.yellow[500],
    );
  }
}