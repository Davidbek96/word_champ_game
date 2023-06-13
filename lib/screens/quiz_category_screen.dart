import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/constants/style_constants.dart';
//import 'package:riddle_leader/screens/home_screen.dart';
import 'package:riddle_leader/screens/listening_screen.dart';
import 'package:riddle_leader/screens/pronounciation_screen.dart';
import 'package:riddle_leader/screens/word_write_screen.dart';

import '../widgets/gradient_icon_mask.dart';
import '../widgets/gobackbtn_and_title.dart';
import 'multiple_choice_screen.dart';

class QuizCategoryScreen extends StatelessWidget {
  const QuizCategoryScreen({required this.levelNumber, super.key});
  final int levelNumber;
  @override
  Widget build(BuildContext context) {
    int colorIndex;
    colorIndex = ((levelNumber - 1) % kGradientColors.length).toInt();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GoBackBtnAndTitle(
                icon: Icons.arrow_back, title: 'Level $levelNumber'),
            const SizedBox(height: 50),
            GridView.count(
              padding: const EdgeInsets.all(30),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: [
                for (int index = 0; index < 4; index++)
                  QuizCategoryBtn(index: index, colorIndex: colorIndex),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCategoryBtn extends StatelessWidget {
  const QuizCategoryBtn({
    super.key,
    required this.index,
    required this.colorIndex,
  });

  final int index;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Get.to(() => const MultipleChoiceScreen());
            break;
          case 1:
            Get.to(() => const PronounciationScreen());
            break;
          case 2:
            Get.to(() => const WordWriteScreen());
            break;
          case 3:
            Get.to(() => const ListeningScreen());
            break;
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0xFF27275E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientIconMask(
              icon: Icon(
                kQuizCategoryIcons[index],
                //Don't change this color, it is under gradient
                color: Colors.white,
                size: 55,
              ),
              colors: [Colors.white, kGradientColors[colorIndex][0]],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Divider(),
            ),
            Text(
              kCategoryLabels[index],
              style: kLabelStyle,
            )
          ],
        ),
      ),
    );
  }
}
