import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';
import 'package:riddle_leader/model/question_model.dart';
import 'package:riddle_leader/services/realtime_database.dart';

import '../constants/question_data.dart';
import 'play_screens/multiple_choice/multiple_choice_play_screen.dart';

// TODO
// update leaderboard with user data comign from DB
// update profile with user data comign from DB
// create a user data structure for this app
// current structure is:
// {
//     uid: user.uid,
//     name: user.name,
//     email: user.email,
//     avatarKey: user.avatarKey,
//     level: user.score,
//     country: user.country,
//     levelUpdatedDT: user.levelUpdatedDay,
// }

final UserDataController _userDataCtrl = Get.find<UserDataController>();

class MultipleChoiceScreen extends StatelessWidget {
  const MultipleChoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultipleChoicePlayScreen(
          quizQestions: List.generate(
            sampleQuestionData.length,
            (index) => QuestionModel.fromMap(sampleQuestionData[index]),
          ),
          onComplete: (correctCount, totalQuestionsCount) async {
            final user = _userDataCtrl.userInfo.value;
            user.score = user.score! + correctCount;
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
