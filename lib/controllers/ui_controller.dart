import 'package:get/get.dart';

class UIController extends GetxController {
  final textFieldSize = 50.0.obs;

  updateTextFieldSize(value) {
    textFieldSize.value = value;
  }
}
