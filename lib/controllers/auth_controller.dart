import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';
import 'package:riddle_leader/model/user_model.dart';
import 'package:riddle_leader/services/auth.dart';
import 'package:riddle_leader/services/realtime_database.dart';

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
  final selectedCountry = Rxn<String?>();

  setSelectedCountry(String? country) {
    if (country == null) return;
    selectedCountry(country);
  }

  Future<void> signUpWithEmailAndPwd() async {
    if (signUpformKey.currentState!.validate()) {
      final user = await AuthService().signUpWithEmailAndPassword(
        emailTextCtrl.value.text,
        passwordTextCtrl.value.text,
      );

      if (user != null) {
        // final userInfo = UserModel(name: nameTextCtrl.value.text);
        final userData = UserModel.defaultUserData;
        userData.name = nameTextCtrl.value.text;
        userData.country = selectedCountry.value ?? "Unknown";
        await RealtimeDatabase().setUserData(userData);
        // await UserDbHelper.instance.insertUser(userInfo);
        _userDataCtrl.setUserInfo(userData);

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

        // await _userDataCtrl.getSetUserInfo();
        final userData = await RealtimeDatabase().fetchCurrentUserInfo();
        if (userData == null) {
          //  could not get the user data from DB
          Fluttertoast.showToast(msg: "Could not fetch the user data from DB");
          return;
        }

        _userDataCtrl.setUserInfo(userData);

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
}
