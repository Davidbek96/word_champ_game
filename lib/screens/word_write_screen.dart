import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/game_controller.dart';
import 'play_screens/multiple_choice/spell_check_test_screen.dart';

final GameController _gameCtrl = Get.find();

class WordWriteScreen extends StatelessWidget {
  const WordWriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpellingCheckTestScreen(
      quizQestions: _gameCtrl.selectedQuestions,
      onComplete: _gameCtrl.updateUserInfoInDB,
    );
  }
}
