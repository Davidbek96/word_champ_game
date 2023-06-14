import 'package:flutter/material.dart';

import '../constants/question_data.dart';
import '../model/question_model.dart';
import 'play_screens/multiple_choice/spell_check_test_screen.dart';

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
          onComplete: (correctCount, totalQuestionsCount) {
            // TODO
          },
        ),
      ),
    );
  }
}
