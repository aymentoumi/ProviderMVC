import 'package:flutter/material.dart';
import 'package:movie_list/main.dart';

import '../model/movie.dart';

class MovieCardView extends StatelessWidget {
  final Movie movie;

  MovieCardView(this.movie);

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: [
            Text('${movie.ranking} - ${movie.title} (${movie.year})'),
            Image.asset(
              movie.imgSrc,
              semanticLabel: movie.imgAlt,
              width: 200.0,
            ),
            Text('Distributor: ${movie.distributor}'),
            Text('Amount: ${movie.amount}'),
            FlatButton(
              color: Colors.red,
              onPressed: () =>
                  movieListApp.movieListView.controller.removeMovie(movie),
              child: Text('Remove'),
            )
          ],
        ),
      );
}
