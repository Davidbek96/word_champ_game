import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';
import 'package:riddle_leader/internal_db/user_info_db_helper.dart';
import 'package:riddle_leader/model/user_model.dart';
import 'package:riddle_leader/services/auth.dart';

import '../screens/login_screen.dart';
import '../screens/home_screen/home_screen.dart';

final UserDataController _userDataCtrl = Get.find();

//we need this controller for user authentication and routing
class AuthController extends GetxController {
  final signUpformKey = GlobalKey<FormState>();
  final signInformKey = GlobalKey<FormState>();
  final nameTextCtrl = TextEditingController().obs;
  final emailTextCtrl = TextEditingController().obs;
  final passwordTextCtrl = TextEditingController().obs;

  Future<void> signUpWithEmailAndPwd() async {
    if (signUpformKey.currentState!.validate()) {
      final user = await AuthService().signUpWithEmailAndPassword(
        emailTextCtrl.value.text,
        passwordTextCtrl.value.text,
      );

      if (user != null) {
        final userInfo = UserModel(name: nameTextCtrl.value.text);
        await UserDbHelper.instance.insertUser(userInfo);
        _userDataCtrl.setUserInfo(userInfo);

        clearTextCtrls();
        // log("=> User register success! ${user.uid}");
        Get.offAll(() => const HomeScreen());
      } else {
        Fluttertoast.showToast(msg: "User sign up failed");
      }
    }
  }

  Future<void> signInWithEmailAndPwd() async {
    if (signInformKey.currentState!.validate()) {
      final user = await AuthService().signInWithEmailAndPassword(
        emailTextCtrl.value.text,
        passwordTextCtrl.value.text,
      );

      if (user != null) {
        clearTextCtrls();
        await _userDataCtrl.getSetUserInfo();
        // log("=> User login success! ${user.uid}");
        Get.offAll(() => const HomeScreen());
      } else {
        Fluttertoast.showToast(msg: "User sign in failed");
      }
    }
  }

  void signOut() {
    AuthService().signOut().then((_) {
      Get.offAll(() => const LoginScreen());
    });
  }

  void clearTextCtrls() {
    nameTextCtrl.value.clear();
    emailTextCtrl.value.clear();
    passwordTextCtrl.value.clear();
  }

  void reset() {
    nameTextCtrl.value.dispose();
    emailTextCtrl.value.dispose();
    passwordTextCtrl.value.dispose();

    nameTextCtrl.value = TextEditingController();
    emailTextCtrl.value = TextEditingController();
    passwordTextCtrl.value = TextEditingController();
  }

  // @override
  // void onReady(){
  //   initAuth();
  //   super.onReady();
  // }

  // void initAuth()async{
  //   //wait for 2 seconds to go from Splash Screen to Introduction Screen
  //   await Future.delayed(const Duration(seconds: 2));
  //   navigateToIntroduction();
  // }

  // //we need this function to navigate from SplashScreen to Introduction Screen
  // //after 2 seconds
  // void navigateToIntroduction(){
  //   //remove all the screens and go to Introduction screen
  //   Get.offAllNamed("/introduction");
  // }
}
