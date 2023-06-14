import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/question_model.dart';

const String answerCorrect = "sound/answer_correct.wav";
const String answerIncorrect = "sound/wrong_answer.mp3";

class SpellingCheckTestScreen extends StatefulWidget {
  final List<QuestionModel> quizQestions;
  final Function(int, int)? onComplete;

  const SpellingCheckTestScreen({
    super.key,
    required this.quizQestions,
    this.onComplete,
  });

  @override
  State<SpellingCheckTestScreen> createState() =>
      _SpellingCheckTestScreenState();
}

class _SpellingCheckTestScreenState extends State<SpellingCheckTestScreen> {
  final player = AudioPlayer();

  final textController = TextEditingController();

  late final int totalQuestions;
  late final List<QuestionModel> questions;

  String userAnswer = '';
  bool isAnswerCorrect = false;
  int currentQuestionIndex = 0;
  int correctAnswerCount = 0;
  bool answerChecked = false;

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _QuestionLinearProgress(
              progress:
                  ((currentQuestionIndex + 1) / (totalQuestions / 100)) / 100,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: BackButton(),
            ),
            SizedBox(height: screenHeight / 40),
            Container(
              constraints: BoxConstraints(minHeight: screenHeight / 7),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
            SizedBox(height: screenHeight / 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 16, right: 16),
              child: Text(
                answerChecked && !isAnswerCorrect
                    ? 'Correct answer: ${questions[currentQuestionIndex].correctAnswerText}'
                    : '',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                autofocus: true,
                readOnly: answerChecked,
                controller: textController,
                decoration: InputDecoration(
                  hintText: answerChecked ? userAnswer : 'Enter your answer',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: !answerChecked
                          ? Colors.blueGrey
                          : isAnswerCorrect
                              ? Colors.green
                              : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: !answerChecked
                          ? Colors.blueGrey
                          : isAnswerCorrect
                              ? Colors.green
                              : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: answerChecked && isAnswerCorrect
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : answerChecked
                          ? const Icon(
                              Icons.close,
                              color: Colors.red,
                            )
                          : null,
                ),
                onChanged: (value) {
                  setState(() => userAnswer = value.trim());
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: answerChecked
                    ? FractionallySizedBox(
                        key: Key('$answerChecked'),
                        widthFactor: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: const Size.fromHeight(50),
                          ),
                          onPressed: nextQuestion,
                          child: Text(
                            currentQuestionIndex == totalQuestions - 1
                                ? 'Result'
                                : 'Next',
                          ),
                        ),
                      )
                    : FractionallySizedBox(
                        key: Key('$answerChecked'),
                        widthFactor: 1,
                        child: ElevatedButton(
                          key: UniqueKey(),
                          onPressed: userAnswer.isEmpty ? null : checkAnswer,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                          ),
                          child: const Text('Check'),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void checkAnswer() {
    setState(() {
      isAnswerCorrect = userAnswer.toLowerCase() ==
          questions[currentQuestionIndex].correctAnswerText.toLowerCase();
      answerChecked = true;
    });
    correctAnswerCount += isAnswerCorrect ? 1 : 0;

    if (isAnswerCorrect) {
      playAudio(answerCorrect);
    } else {
      playAudio(answerIncorrect);
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex == totalQuestions - 1) {
      Get.defaultDialog(
        title: "Result",
        middleText: "You got $correctAnswerCount/$totalQuestions",
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                userAnswer = '';
                isAnswerCorrect = false;
                correctAnswerCount = 0;
                currentQuestionIndex = 0;
                answerChecked = false;
                textController.clear();
              });
              widget.onComplete?.call(correctAnswerCount, totalQuestions);
              Get.back();
            },
            child: const Text("Play again"),
          ),
          TextButton(
            onPressed: () {
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
      userAnswer = '';
      answerChecked = false;
      textController.clear();
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
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
