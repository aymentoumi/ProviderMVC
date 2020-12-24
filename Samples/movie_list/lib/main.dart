import 'package:flutter/material.dart';

import 'view/movie_list_view.dart';

MovieListApp movieListApp = MovieListApp();
void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: movieListApp),
    );

class MovieListApp extends StatelessWidget {
  final MovieListView movieListView = MovieListView();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Movie List'),
        ),
        body: Center(
          child: movieListView,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: movieListView.controller.reset,
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
        ),
      );
}
