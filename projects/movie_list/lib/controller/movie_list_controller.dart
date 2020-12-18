import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:provider_mvc/controller.dart';

import '../model/movie.dart';

class MovieListController extends Controller {
  List<Movie> _movies;

  void removeMovie(Movie movie) {
    _movies.remove(movie);
    update();
  }

  void reset() {
    _movies = null;
    update();
  }

  Future loadData() async {
    if (_movies == null) {
      _movies = [];
      String jsonString = await rootBundle.loadString("assets/data.json");
      List data = jsonDecode(jsonString);
      data.forEach((movie) {
        _movies.add(
          Movie(
              id: movie['id'],
              title: movie['title'],
              distributor: movie['distributor'],
              year: movie['year'],
              amount: movie['amount'],
              imgSrc: movie['img']['src'],
              imgAlt: movie['img']['alt'],
              ranking: movie['ranking']),
        );
      });
    }
    return _movies;
  }
}
