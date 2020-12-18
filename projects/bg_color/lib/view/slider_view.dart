import 'package:bg_color/main.dart';
import 'package:flutter/material.dart';
import '../controller/slider_controller.dart';
import 'package:provider_mvc/view.dart';

class SliderView extends View<SliderController> {
  final Color _color;

  SliderView(this._color) : super(SliderController());

  @override
  Widget builder(
      BuildContext context, SliderController controller, Widget widget) {
    return Slider(
      activeColor: _color,
      value: controller.value.toDouble(),
      min: 0,
      max: 255,
      divisions: 256,
      label: '${controller.value}',
      onChanged: (value) {
        controller.value = value.toInt();
        homeScreen.controller.update();
      },
    );
  }
}
