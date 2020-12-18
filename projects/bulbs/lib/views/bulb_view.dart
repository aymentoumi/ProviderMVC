import 'package:bulbs/main.dart';
import 'package:flutter/material.dart';
import '../controllers/bulb_controller.dart';
import 'package:provider_mvc/view.dart';

class BulbView extends View<BulbController> {
  BulbView() : super(BulbController());

  @override
  Widget builder(
      BuildContext context, BulbController controller, Widget widget) {
    return GestureDetector(
      onTap: () {
        controller.toggle();
        homeScreen.controller.update();
      },
      child: Container(
        height: 200,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: controller.isOn
              ? <BoxShadow>[
                  BoxShadow(
                      spreadRadius: 5, color: Colors.orange, blurRadius: 100)
                ]
              : null,
          color: controller.isOn ? Colors.yellow : Colors.white,
        ),
      ),
    );
  }
}
