import 'package:flutter/material.dart';
import 'package:provider_mvc/view.dart';

import '../controller/movie_list_controller.dart';
import '../model/movie.dart';
import 'movie_card_view.dart';

class MovieListView extends View<MovieListController> {
  MovieListView() : super(MovieListController());

  Widget _create(List<Movie> movies) {
    List<Widget> items = [];
    movies.forEach((movie) => items.add(MovieCardView(movie)));
    return ListView(
      children: items,
    );
  }

  @override
  Widget builder(BuildContext context, MovieListController controller,
          Widget widget) =>
      FutureBuilder(
        future: controller.loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return _create(snapshot.data);
          return CircularProgressIndicator();
        },
      );
}
