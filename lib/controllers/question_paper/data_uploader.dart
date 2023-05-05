import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//============= Storing file path and name =============

class DataUploaderController extends GetxController {
  @override
  //onReady is called once so we are using dataUpload method inside here
  void onReady() {
    dataUpload();
    super.onReady();
  }

  Future<void> dataUpload() async {
    //Getting access in assets folder and storing the data into manifestContent variable
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    //Decoding manifestContent file into json file and storing them in manifestMap variable
    //which data type is Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //Choosing a folder in assets folder and choosing only the .json files and converting map to list
    // and storing the file in paperInAssets variable and file type will be List<String>
    //
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();

    print(paperInAssets);
  }
}
