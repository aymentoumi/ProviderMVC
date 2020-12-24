import 'package:flutter/material.dart';
import 'package:provider_mvc/controller.dart';
import 'package:provider_mvc/view.dart';

class TextFieldController extends Controller {
  String _error;

  set error(String err) {
    _error = err;
    update();
  }
}

class TextFieldView extends View<TextFieldController> {
  final String hint;

  final TextEditingController _textEditingController = TextEditingController();

  TextFieldView({this.hint}) : super(TextFieldController());

  String get text => _textEditingController.text;

  @override
  Widget builder(BuildContext context, TextFieldController controller,
          Widget widget) =>
      TextField(
        controller: _textEditingController,
        decoration:
            InputDecoration(hintText: hint, errorText: controller._error),
        onChanged: (text) => controller.error = null,
      );
}
