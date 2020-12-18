import 'package:flutter/widgets.dart';

///
/// The [Controller] class give a way to update the model and to refresh the view. Also, it provide an easy access to different app controllers.
///
/// Sample class :
/// ```dart
/// class CounterController extends Controller {
///   int _count = 0;
///
///   int get count => _count;
///
///   set count(int v) {
///     _count = v;
///     update();
///   }
///
///   void reset() {
///     _count = 0;
///     update();
///   }
///
///   void increment() {
///     _count++;
///     update();
///   }
/// }
/// ```
///
class Controller extends ChangeNotifier {
  ///
  /// Update the view state associated to the controller
  ///
  void update() => notifyListeners();
}
