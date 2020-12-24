import 'package:provider_mvc/controller.dart';
import '../models/bulb.dart';

class BulbController extends Controller {
  final _bulb = Bulb();

  void toggle() {
    _bulb.isOn = !_bulb.isOn;
    update();
  }

  bool get isOn => _bulb.isOn;
}
