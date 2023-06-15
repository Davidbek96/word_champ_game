import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/screens/play_screens/multiple_choice/listening_multiple_choice_play_screen.dart';

import '../controllers/game_controller.dart';

final GameController _gameCtrl = Get.find();

class ListeningScreen extends StatelessWidget {
  const ListeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListeningMultipleChoicePlayScreen(
      quizQestions: _gameCtrl.selectedQuestions,
      onComplete: _gameCtrl.updateUserInfoInDB,
    );
  }
}
