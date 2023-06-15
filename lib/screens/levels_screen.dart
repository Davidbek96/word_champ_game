// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:riddle_leader/constants/question_data.dart';
import 'package:riddle_leader/controllers/game_controller.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';

import '../constants/game_const.dart';
import '../widgets/gobackbtn_and_title.dart';
import 'quiz_category_screen.dart';
import '../constants/style_constants.dart';

final UserDataController _userDataCtrl = Get.find();
final GameController _gameCtrl = Get.find();

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GoBackBtnAndTitle(icon: Icons.arrow_back, title: 'Levels'),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(30),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 50,
                ),
                itemCount: sampleQuestionData.length ~/ kQuestionsCountPerLevel,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () => openCategoryScreen(index),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Obx(
                          () => ClipPolygon(
                            sides: 5,
                            borderRadius: 15.0,
                            //rotate: 70.0,
                            boxShadows: [
                              PolygonBoxShadow(
                                  color: Colors.black, elevation: 5.0),
                              PolygonBoxShadow(
                                  color: Colors.red, elevation: 7.0),
                            ],
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.center,
                                  colors: kGradientColors[
                                      (index % kGradientColors.length).toInt()],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Level',
                                    style: kLabelStyle.copyWith(
                                      color: _userDataCtrl
                                                  .userInfo.value.openLevel! <
                                              index + 1
                                          ? Colors.white38
                                          : null,
                                    ),
                                  ),
                                  Text(
                                    index < 9
                                        ? '0${index + 1}'
                                        : '${index + 1}',
                                    style: kLabelStyle.copyWith(
                                      color: _userDataCtrl
                                                  .userInfo.value.openLevel! <
                                              index + 1
                                          ? Colors.white38
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 15,
                          child: Icon(
                            Icons.star,
                            color: Color(0xFFFAB52A),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          child: Icon(
                            Icons.star,
                            color: Color(0xFFFAB52A),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 15,
                          child: Icon(
                            Icons.star,
                            color: Color(0xFFFAB52A),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void openCategoryScreen(int index) {
    if (index > _userDataCtrl.userInfo.value.openLevel! - 1) {
      final msg =
          "Complete Level ${index.toString().padLeft(2, '0')} to open Level ${(index + 1).toString().padLeft(2, '0')}";

      Get.defaultDialog(
        title: "Locked level",
        middleText: msg,
      );
      return;
    }
    // else user can play this level
    _gameCtrl.setSelectedLevel(index + 1);
    _gameCtrl.setSelectedQuestionsByLevelCardIndex(index);
    Get.to(
      () => QuizCategoryScreen(
        levelNumber: (index + 1).toInt(),
      ),
    );
  }
}
