import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/game_controller.dart';

import 'play_screens/multiple_choice/multiple_choice_play_screen.dart';

final GameController _gameCtrl = Get.find();

class MultipleChoiceScreen extends StatelessWidget {
  const MultipleChoiceScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultipleChoicePlayScreen(
      quizQestions: _gameCtrl.selectedQuestions,
      onComplete: _gameCtrl.updateUserInfoInDB,
    );
  }
}
