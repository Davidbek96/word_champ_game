import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_uploader_screen.dart';
import '../screens/leaderboard_screen.dart';
import '/screens/levels_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Galaxy man image and decorataion
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/decoration_images/homescreen_galaxyman.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const Levels());
                },
                child: const Text(
                  'Play Now',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: It should go to LeaderBoardScreen
                  Get.to(() => DataUploaderScreen());
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Leader Board',
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
