import 'package:flutter/material.dart';
import 'package:riddle_leader/widgets/gobackbtn_and_title.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                GoBackBtnAndTitle(icon: Icons.arrow_back, title: 'About'),
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Word Champ Game',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Developer:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Usmonov Dovudjon',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'This language learning app helps you to improve your language skills in a fun and interactive way. Learn vocabulary, practice grammar, and enhance your speaking and listening skills through engaging exercises and quizzes.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 16.0),
                Text(
                  'The Korean Learning App is designed to help you learn the Korean language in a fun and interactive way. Whether you are a beginner or an advanced learner, this app provides a wide range of resources and features to enhance your language skills.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Key Features:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '- Vocabulary Building: Learn and practice a wide range of Korean words and phrases to expand your vocabulary.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                Text(
                  '- Grammar Lessons: Explore the fundamentals of Korean grammar through easy-to-understand lessons and examples.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                Text(
                  '- Listening and Speaking Exercises: Improve your listening and speaking skills by engaging in interactive exercises and conversations.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                Text(
                  '- Quiz Games: Test your knowledge and track your progress with fun and challenging quiz games designed to reinforce your learning.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Get Started:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Download the Word-Champ Game now and embark on an exciting journey to master the Korean language. Start your language learning adventure and unlock a world of new opportunities!',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
