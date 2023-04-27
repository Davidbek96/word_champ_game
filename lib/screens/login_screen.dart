import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/screens/navigation_page.dart';

import 'create_account_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/decoration_images/running_boy.png',
            height: 150.0,
            width: 150.0,
          ),
          Text(
            'Word Champ',
            style: GoogleFonts.shojumaru(color: Colors.orange, fontSize: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              height: 50.0,
              child: TextField(
                style: TextStyle(color: Colors.white60, fontSize: 16),
                decoration: InputDecoration(
                  labelText: 'User name',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              height: 50.0,
              child: TextField(
                style: TextStyle(color: Colors.white60, fontSize: 16),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
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
                  Get.to(() => MyBottomNavigationBar(), 
                  transition: Transition.fade,
                  duration: const Duration(seconds:1));
                },
                child: const Text(
                  'Login',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Pasword ?',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Help',
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Not registered ?',
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(const CreateAccountScreen());
                      },
                      child: const Text(
                        'Create Account',
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
