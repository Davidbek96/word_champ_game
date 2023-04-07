import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/constants/style_constants.dart';

import '../widgets/gradient_icon_mask.dart';
import '../widgets/gobackbtn_and_title.dart';

class QuizCategoryScreen extends StatelessWidget {
  const QuizCategoryScreen({required this.levelNumber, super.key});
  final int levelNumber;
  @override
  Widget build(BuildContext context) {
    int _colorIndex;
    _colorIndex = ((levelNumber - 1) % kGradientColors.length).toInt();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GoBackBtnAndTitle(
                icon: Icons.arrow_back, title: 'Level $levelNumber'),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1.2,
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 8, //TODO-levels.length change,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: const Color(0xFF27275E),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientIconMask(
                            icon: Icon(
                              kQuizCategoryIcons[index],
                              //Don't change this color, it is under gradient
                              color: Colors.white,
                              size: 50,
                            ),
                            colors: [
                              Colors.white,
                              kGradientColors[_colorIndex][0]
                            ],
                          ),
                          Text(
                            kCategoryLabels[index],
                            style: kLabelStyle,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
