import 'package:flutter/material.dart';
import './screens/home_screen.dart';

final HomeScreen homeScreen = HomeScreen();

void main() => runApp(MaterialApp(
      home: homeScreen,
      debugShowCheckedModeBanner: false,
    ));
