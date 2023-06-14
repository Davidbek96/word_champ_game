import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/question_data.dart';
import '../controllers/user_data_controller.dart';
import '../model/question_model.dart';
import '../services/realtime_database.dart';
import 'play_screens/multiple_choice/spell_check_test_screen.dart';

final UserDataController _userDataCtrl = Get.find<UserDataController>();

class WordWriteScreen extends StatelessWidget {
  const WordWriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpellingCheckTestScreen(
          quizQestions: List.generate(
            sampleQuestionData.length,
            (index) => QuestionModel.fromMap(sampleQuestionData[index]),
          ),
          onComplete: (correctCount, totalQuestionsCount) async {
            final user = _userDataCtrl.userInfo.value;
            user.level = user.level! + correctCount;
            // TODO
            user.levelUpdatedDay = DateTime.now().millisecondsSinceEpoch;
            await RealtimeDatabase().setUserData(user);
            await _userDataCtrl.getSetUserInfo();
          },
        ),
      ),
    );
  }
}
