import 'package:flutter/material.dart';
import 'package:provider_mvc/controller.dart';
import '../views/bulb_view.dart';
import 'package:provider_mvc/view.dart';

class HomeScreen extends View {
  final _bulbs = [BulbView(), BulbView(), BulbView()];

  HomeScreen() : super(Controller());

  bool get _isAllOn {
    bool v = true;

    _bulbs.forEach((bulb) => v &= bulb.controller?.isOn ?? false);
    return v;
  }

  @override
  Widget builder(BuildContext context, Controller controller, Widget widget) {
    return Scaffold(
      backgroundColor: _isAllOn ? Colors.yellow[100] : Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bulbs,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bulbs.forEach((bulb) => bulb.controller?.toggle());
          controller.update();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
