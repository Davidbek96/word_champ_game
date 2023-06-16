import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/auth_controller.dart';
import 'package:riddle_leader/helpers/custom_validator.dart';
import 'package:riddle_leader/screens/login_screen.dart';

final AuthController _authCtrl = Get.find();

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: Get.height / 16),
        child: Obx(
          () => Form(
            key: _authCtrl.signUpformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/decoration_images/create_account.png',
                  height: 130.0,
                  width: 130.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SizedBox(
                    height: 50.0,
                    child: TextFormField(
                      controller: _authCtrl.nameTextCtrl.value,
                      validator: CustomValidator.validateUserName,
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 16),
                      decoration: const InputDecoration(
                        labelText: 'User name',
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
                      controller: _authCtrl.emailTextCtrl.value,
                      validator: CustomValidator.validateEmail,
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 16),
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
                      style:
                          const TextStyle(color: Colors.white60, fontSize: 16),
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: const Color(0xFF6949FE),
                        width: 1.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 50.0,
                    child: DropdownButton<String>(
                      value: _authCtrl.selectedCountry.value,
                      hint: const Text(
                        'Select a country',
                        style: TextStyle(
                          color: Colors.white38,
                        ),
                      ),
                      onChanged: _authCtrl.setSelectedCountry,
                      items: <String>[
                        'South Korea',
                        'Uzbekistan',
                        'United States',
                        'Canada',
                        'United Kingdom',
                        'Australia',
                        'Germany',
                        'France',
                        'Japan',
                        'China',
                        'Brazil',
                        'India',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      underline:
                          const SizedBox(), // Remove the default underline
                      isExpanded:
                          true, // Ensure the dropdown button fills the available width
                      icon: const Icon(Icons
                          .arrow_drop_down), // Customize the dropdown icon if needed
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _authCtrl.signUpWithEmailAndPwd,
                      child: const Text(
                        'Create Account',
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
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Already have an account ?',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _authCtrl.reset();
                              // Get.back();
                              Get.offAll(() => LoginScreen());
                            },
                            child: const Text(
                              'Login',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
