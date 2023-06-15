import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
// import 'package:english_pocket_dictionary/components/custom_simple_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/question_model.dart';

// ##############

const String answerCorrect = "sound/answer_correct.wav";
const String answerIncorrect = "sound/wrong_answer.mp3";

const Color _defaultOptionBgColor = Colors.white;
const Color _correctAnswerBgColor = Colors.green;
const Color _incorrectAnswerBgColor = Colors.red;
const Color _shownCorrectAnswerBgColor = Colors.amber;
const Color _progressColor = Colors.amber;

// ########################
class MultipleChoicePlayScreen extends StatefulWidget {
  final List<QuestionModel> quizQestions;
  final Function(int, int)? onComplete;
  const MultipleChoicePlayScreen({
    super.key,
    required this.quizQestions,
    this.onComplete,
  });

  @override
  State<MultipleChoicePlayScreen> createState() =>
      _MultipleChoicePlayScreenState();
}

class _MultipleChoicePlayScreenState extends State<MultipleChoicePlayScreen> {
  final player = AudioPlayer();

  late final int totalQuestions;
  late final List<QuestionModel> questions;

  int currentQuestionIndex = 0;
  int correctAnswerCount = 0;
  int selectedOptionIndex = -1;
  bool showCorrectAnswer = false;

  @override
  void initState() {
    super.initState();
    questions = widget.quizQestions;
    totalQuestions = questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const BackButton(),
        bottom: PreferredSize(
          preferredSize: Size(screenWidth, 4),
          child: _QuestionLinearProgress(
            progress:
                ((currentQuestionIndex + 1) / (totalQuestions / 100)) / 100,
          ),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            height: Get.height / 1.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: screenHeight / 20),
                Container(
                  constraints: BoxConstraints(minHeight: screenHeight / 5),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blueGrey,
                      width: 0.2,
                    ),
                  ),
                  child: Text(
                    questions[currentQuestionIndex].questionText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight / 10),
                ...questions[currentQuestionIndex]
                    .optionsList
                    .asMap()
                    .entries
                    .map(
                  (option) {
                    final optionIndex = option.key;
                    final optionText = option.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          // prevent user from selecting option again
                          // for the same question
                          if (selectedOptionIndex != -1) return;
                          setState(() {
                            selectedOptionIndex = optionIndex;
                            showCorrectAnswer = true;
                          });

                          if (isCorrectAnswer(selectedOptionIndex)) {
                            playAudio(answerCorrect);
                          } else {
                            playAudio(answerIncorrect);
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: getColorForOption(optionIndex),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              if (getIconForOption(optionIndex) != null)
                                Icon(
                                  getIconForOption(optionIndex),
                                  color: getIconForOption(optionIndex) == null
                                      ? Colors.blueGrey
                                      : Colors.white,
                                ),
                              if (getIconForOption(optionIndex) != null)
                                const SizedBox(width: 12),
                              Text(
                                optionText,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: [
                                    _correctAnswerBgColor,
                                    _incorrectAnswerBgColor,
                                    _shownCorrectAnswerBgColor
                                  ].contains(getColorForOption(optionIndex))
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                if (selectedOptionIndex != -1)
                  ElevatedButton(
                    onPressed: nextQuestion,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      currentQuestionIndex == totalQuestions - 1 &&
                              selectedOptionIndex != -1
                          ? 'Result'
                          : 'Next',
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ##############

  bool isCorrectAnswer(int index) {
    final isCorrect = questions[currentQuestionIndex].optionsList[index] ==
        questions[currentQuestionIndex].correctAnswerText;

    return isCorrect;
  }

  IconData? getIconForOption(int index) {
    if (selectedOptionIndex == index) {
      if (isCorrectAnswer(index)) {
        return Icons.check;
      } else {
        return Icons.close;
      }
    } else if (showCorrectAnswer && isCorrectAnswer(index)) {
      return Icons.wb_incandescent_outlined;
    } else {
      return null;
    }
  }

  Color getColorForOption(int index) {
    if (selectedOptionIndex == index) {
      if (isCorrectAnswer(index)) {
        return _correctAnswerBgColor;
      } else {
        return _incorrectAnswerBgColor;
      }
    } else if (showCorrectAnswer && isCorrectAnswer(index)) {
      return _shownCorrectAnswerBgColor;
    } else {
      return _defaultOptionBgColor;
    }
  }

  // ##############
  void nextQuestion() {
    correctAnswerCount += isCorrectAnswer(selectedOptionIndex) ? 1 : 0;

    if (currentQuestionIndex == totalQuestions - 1) {
      Get.defaultDialog(
        title: "Result",
        middleText: "You got $correctAnswerCount/$totalQuestions",
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedOptionIndex = -1;
                showCorrectAnswer = false;
                correctAnswerCount = 0;
                currentQuestionIndex = 0;
              });

              Get.back();
            },
            child: const Text("Play again"),
          ),
          TextButton(
            onPressed: () {
              widget.onComplete?.call(correctAnswerCount, totalQuestions);

              Get.back();
              Get.back();
            },
            child: const Text("Done"),
          ),
        ],
        barrierDismissible: false,
      );

      return;
    }
    setState(() {
      selectedOptionIndex = -1;
      showCorrectAnswer = false;
      currentQuestionIndex += 1;
    });
    log("===> correctAnswerCount: $correctAnswerCount");
  }

  // ###########
  Future<void> playAudio(String src) async {
    await player.play(AssetSource(src));
  }
}

// ############################
class _QuestionLinearProgress extends StatelessWidget {
  const _QuestionLinearProgress({
    Key? key,
    required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedFractionallySizedBox(
          duration: const Duration(milliseconds: 900),
          widthFactor: progress,
          heightFactor: 1,
          child: Container(
            color: _progressColor,
          ),
        ),
      ),
    );
  }
}
