import 'package:flutter/material.dart';
import 'package:provider_mvc/controller.dart';
import 'package:provider_mvc/view.dart';

import '../view/slider_view.dart';

class HomeScreen extends View {
  final SliderView redSlider = SliderView(Colors.red);
  final SliderView greenSlider = SliderView(Colors.green);
  final SliderView blueSlider = SliderView(Colors.blue);

  HomeScreen() : super(Controller());

  @override
  Widget builder(BuildContext context, Controller controller, Widget widget) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, redSlider.controller.value,
          greenSlider.controller.value, blueSlider.controller.value),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            redSlider,
            greenSlider,
            blueSlider,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          redSlider.controller.value = 0;
          greenSlider.controller.value = 0;
          blueSlider.controller.value = 0;
          controller.update();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
