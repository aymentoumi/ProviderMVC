import 'package:provider_mvc/controller.dart';

class SliderController extends Controller {
  int _value = 0;

  set value(int v) {
    _value = v;
    update();
  }

  int get value => _value;
}
