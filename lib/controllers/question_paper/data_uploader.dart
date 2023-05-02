import 'dart:developer';
import 'package:get/get.dart';

class DataUploaderController extends GetxController {
  @override
  //onReady is called once so we are using dataUpload method inside here
  void onReady() {
    dataUpload();
    super.onReady();
  }

  void dataUpload() {
    log("Data is uploading");
  }
}
