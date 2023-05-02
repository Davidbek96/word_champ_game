// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

import '../widgets/gobackbtn_and_title.dart';
import 'quiz_category_screen.dart';
import '../constants/style_constants.dart';
import '/controllers/user_data_controller.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataController userDataController = Get.find();
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
                itemCount: 100, //TODO-levels.length change,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => QuizCategoryScreen(
                          levelNumber: (index + 1).toInt(),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        ClipPolygon(
                          sides: 5,
                          borderRadius: 15.0,
                          //rotate: 70.0,
                          boxShadows: [
                            PolygonBoxShadow(
                                color: Colors.black, elevation: 5.0),
                            PolygonBoxShadow(color: Colors.red, elevation: 7.0),
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
                                const Text(
                                  'Level',
                                  style: kLabelStyle,
                                ),
                                Text(
                                  index < 9 ? '0${index + 1}' : '${index + 1}',
                                  style: kLabelStyle,
                                ),
                              ],
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
}
