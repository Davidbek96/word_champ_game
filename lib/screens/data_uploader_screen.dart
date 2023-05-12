import 'package:flutter/material.dart';
import 'package:riddle_leader/firebase_ref/loading_status.dart';
import '../controllers/question_paper/data_uploader.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  // We are injecting controller here. Becase it is called just once
  DataUploaderController controller = Get.put(DataUploaderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(controller.loadingStatus.value == LoadingStatus.compleated
              ? "Uploading completed"
              : "Uploaing ..."),
        ),
      ),
    );
  }
}
