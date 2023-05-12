import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/firebase_ref/references.dart';

import '../../model/question_paper_model.dart';

//============= Storing file path and name =============

class DataUploaderController extends GetxController {
  @override
  //onReady is called once so we are using dataUpload method inside here
  void onReady() {
    dataUpload();
    super.onReady();
  }

  Future<void> dataUpload() async {
    final fireStore = FirebaseFirestore.instance;
    //Getting access in assets folder and storing the data into manifestContent variable
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    //Decoding manifestContent file into json file and storing them in manifestMap variable
    //which data type is Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //Choosing a folder in assets folder and choosing only the .json files and converting map to list
    // and storing the file in paperInAssets variable and file type will be List<String>
    // in short , we are getting the path of files with their names
    final paperInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/paper") && path.contains(".json"))
        .toList();
    //creating empty List to keep question papers
    List<QuestionPaperModel> questionPapers = [];

    for (var paper in paperInAssets) {
      String StringPaperContent = await rootBundle.loadString(paper);

      //adding files as a list (bilogy, chemesitry, ... papers)
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(StringPaperContent)));
    }

    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(
        questionPaperRF.doc(paper.id),
        {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "description": paper.description,
          "time_seconds": paper.timeSeconds,
          //questions can be null , so we are checking if it is null
          "question_count":
              paper.questions == null ? 0 : paper.questions!.length,
        },
      );
    }
    await batch.commit();
  }
}
