import 'package:flutter/material.dart';
import 'package:provider_mvc/controller.dart';
import 'package:provider_mvc/view.dart';

final CounterApp counterApp = CounterApp();

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: counterApp),
    );

class Value {
  int value = 0;
}

class CounterApp extends StatelessWidget {
  final _counter = CounterView();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: _counter,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _counter.controller.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
}

class CounterController extends Controller {
  final Value _count = Value();

  int get count => _count.value;

  void reset() {
    _count.value = 0;
    update();
  }

  void increment() {
    _count.value++;
    update();
  }
}

class CounterView extends View<CounterController> {
  CounterView() : super(CounterController());

  @override
  Widget builder(
          BuildContext context, CounterController controller, Widget widget) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${controller.count}',
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
            child: Text("Reset"),
            onPressed: controller.reset,
          )
        ],
      );
}
