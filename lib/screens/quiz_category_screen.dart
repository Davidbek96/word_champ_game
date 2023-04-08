import 'package:flutter/material.dart';
import 'package:riddle_leader/constants/style_constants.dart';

import '../widgets/gradient_icon_mask.dart';
import '../widgets/gobackbtn_and_title.dart';

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
            Expanded(
              child: GridView.count(
                crossAxisCount:2,
                children: [
                  
                ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({
    super.key,
    required this.colorIndex,
  });

  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.auto_awesome_motion),
          tileColor: kGradientColors[colorIndex][0],
          title: Text('Multiple choice'),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
    );
  }
}

class GridViewCategory extends StatelessWidget {
  const GridViewCategory({
    super.key,
    required this.colorIndex,
  });

  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                  colors: [Colors.white, kGradientColors[colorIndex][0]],
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
    );
  }
}
