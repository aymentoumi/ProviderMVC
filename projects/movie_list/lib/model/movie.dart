import 'package:flutter/foundation.dart';

class Movie {
  final int id, ranking, year;
  final String title, distributor, amount, imgSrc, imgAlt;

  Movie(
      {@required this.id,
      @required this.imgSrc,
      @required this.imgAlt,
      @required this.ranking,
      @required this.year,
      @required this.title,
      @required this.distributor,
      @required this.amount});
}
