import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvc/controller.dart';

///
/// The [View] class reflect the model presentation and notify controller about different events.
///
/// Sample use :
/// ```dart
/// class CounterView extends View<CounterController> {
///   CounterView() : super(CounterController());
///
///   @override
///   Widget builder(BuildContext context, CounterController controller, Widget widget) =>
///     Column(
///       mainAxisAlignment: MainAxisAlignment.center,
///       children: [
///         Text("Counter : ${controller.count}"),
///         RaisedButton(
///           child: Text("Increment"),
///           onPressed: controller.increment,
///         )
///       ]
///     );
/// }
/// ```
///
abstract class View<T extends Controller> extends StatelessWidget {
  ///
  /// Optional view's [controller] attribut by default it's null
  /// unless it's defined in the constructor
  ///
  final T controller;

  ///
  /// Constructor
  ///
  const View(this.controller);

  ///
  /// Return the [View] widget
  ///
  /// Sample use :
  /// ```dart
  ///   @override
  ///   Widget builder(BuildContext context, CounterController controller, Widget widget) =>
  ///     Column(
  ///       mainAxisAlignment: MainAxisAlignment.center,
  ///       children: [
  ///         Text("Counter : ${controller.count}"),
  ///         RaisedButton(
  ///           child: Text("Increment"),
  ///           onPressed: controller.increment,
  ///         )
  ///       ]
  ///     );
  ///
  Widget builder(BuildContext context, T controller, Widget widget);

  ///
  /// The [View] widget build function - not to override
  ///
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<T>.value(
        value: controller,
        child: Consumer<T>(builder: builder),
      );

  ///
  /// Refresh the view
  ///
  void refresh() => controller.update();
}
