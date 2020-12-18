import 'package:flutter/material.dart';
import 'view/home_screen.dart';

final HomeScreen homeScreen = HomeScreen();

void main() => runApp(MaterialApp(
      home: homeScreen,
      debugShowCheckedModeBanner: false,
    ));
