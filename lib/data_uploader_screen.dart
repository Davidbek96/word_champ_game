import 'package:flutter/material.dart';
import 'controllers/question_paper/data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  // We are injecting controller here. Becase it is called just once
  DataUploaderController controller = Get.put(DataUploaderController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Data is uploading")),
    );
  }
}
