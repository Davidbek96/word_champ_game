import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riddle_leader/controllers/auth_controller.dart';
import 'package:riddle_leader/helpers/custom_validator.dart';
import 'package:riddle_leader/screens/home_screen/home_screen.dart';
import 'create_account_screen.dart';

final AuthController _authCtrl = Get.find();

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
          Obx(
            () => Form(
              key: _authCtrl.signInformKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        controller: _authCtrl.emailTextCtrl.value,
                        validator: CustomValidator.validateEmail,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 16),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: SizedBox(
                      height: 50.0,
                      child: TextFormField(
                        controller: _authCtrl.passwordTextCtrl.value,
                        validator: CustomValidator.validatePassword,
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 16),
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _authCtrl.signInWithEmailAndPwd,
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
                        _authCtrl.reset();

                        Get.offAll(() => const CreateAccountScreen());
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
