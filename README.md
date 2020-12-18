# Provider MVC

Flutter Provider MVC Implementation.

## Getting Started

This project is the base of the Flutter package [provider_mvc](https://pub.dev/packages/provider_mvc)

For more information see this article
[Flutter Provider MVC Implementation](https://medium.com/@aymen.toumi/flutter-provider-mvc-implementation-267971a9c810)

## Examples

Let's see some examples of MVC app.

### Counter App

As a [default example](https://github.com/aymentoumi/ProviderMVC/tree/main/example), we developed our version of the famous flutter counter app.

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/example/asset/counter.gif)

#### Step 1

**Model** class definition.
Because our app is too basic we can even skip model declaration but for pedagogical reasons we will create one.
The model can be an easy PODO (Plain Old Dart Object).

```
class Value {
    int value = 0;
}
```

#### Step 2

**Controller** class definition:

```
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
```

#### Step 3

**View** class definition.

```
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
```

#### Step 4

The app class.

```
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
```

#### Step 5

The main file.

```
final CounterApp counterApp = CounterApp();

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: counterApp),
    );
```

### Other examples

[**BG Color App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/bg_color)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/bg_color/image/bg_color.gif)

[**Bulbs App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/bulbs)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/bulbs/image/bulbs.gif)

[**Movie List App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/movie_list)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/movie_list/image/movie_list.gif)

[**Github Portfolio App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/portfolio)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/portfolio/image/portfolio.gif)

[**Project Management Board App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/project_board)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/project_board/image/project_board.gif)

[**Community Feed App**](https://github.com/aymentoumi/ProviderMVC/tree/main/projects/community_feed)

![image](https://raw.githubusercontent.com/aymentoumi/ProviderMVC/main/projects/community_feed/image/project_board.gif)