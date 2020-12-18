import 'package:flutter/material.dart';
import 'screen/feed_screen.dart';
import 'util/screen_type.dart';

final FeedScreen homeScreen = FeedScreen(),
    favoriteScreen = FeedScreen(ScreenType.favorites);

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => homeScreen,
          '/favorites': (context) => favoriteScreen,
        },
      ),
    );
