import 'package:flutter/material.dart';
import 'package:riddle_leader/model/question_model.dart';

import '../constants/question_data.dart';
import 'play_screens/multiple_choice/multiple_choice_play_screen.dart';

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
          onComplete: (correctCount, totalQuestionsCount) {
            // TODO
          },
        ),
      ),
    );
  }
}
