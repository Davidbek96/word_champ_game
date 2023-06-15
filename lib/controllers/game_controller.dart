import 'dart:developer';

import 'package:get/get.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';
import 'package:riddle_leader/model/question_model.dart';

import '../constants/game_const.dart';
import '../constants/question_data.dart';
import '../services/realtime_database.dart';

final UserDataController _userDataCtrl = Get.find<UserDataController>();

class GameController extends GetxController {
  final selectedLevel = 1.obs;
  final selectedQuestions = <QuestionModel>[].obs;

  // ###########
  void setSelectedLevel(int level) {
    selectedLevel(level);
  }

  // ###########
  void setSelectedQuestionsByLevelCardIndex(int index) {
    final startIndex = index * kQuestionsCountPerLevel;
    final endIndex = (index + 1) * kQuestionsCountPerLevel;
    final sublist = sampleQuestionData.sublist(
      startIndex,
      endIndex > sampleQuestionData.length
          ? sampleQuestionData.length
          : endIndex,
    );

    log("=> ${sublist.length}");

    final questions = List.generate(
      sublist.length,
      (index) => QuestionModel.fromMap(sublist[index]),
    );

    selectedQuestions(questions);
  }

  // ###########
  void updateUserInfoInDB(correctCount, totalQuestionsCount) async {
    final user = _userDataCtrl.userInfo.value;
    user.score = (user.score! + (correctCount * 2)).toInt();
    if (selectedLevel.value > user.openLevel!) {
      user.openLevel = selectedLevel.value + 1;
    }
    user.levelUpdatedDay = DateTime.now().millisecondsSinceEpoch;
    await RealtimeDatabase().setUserData(user);
    await _userDataCtrl.getSetUserInfo();
  }
}
