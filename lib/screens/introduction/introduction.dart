import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:riddle_leader/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          //Get.width*0.2 is the 20% of what we have in size
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
                color: Colors.amber,
              ),
              const SizedBox(height: 40),
              const Text(
                  "Welcome to the Word Champ Game! Learn new words with fun and participate in the word championship. See you in the Battle Ground!"),
              const SizedBox(height: 40),
              AppCircleButton(
                onTap: () {},
                child: const Icon(Icons.arrow_forward, size: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
