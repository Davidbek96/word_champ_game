import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riddle_leader/bindings/initial_bindings.dart';
import 'package:riddle_leader/screens/languages.dart';
import 'package:riddle_leader/screens/loading_screen/lodaing_screen.dart';
import 'package:riddle_leader/screens/home_screen/home_screen.dart';
import 'package:riddle_leader/services/auth.dart';
import 'package:riddle_leader/services/realtime_database.dart';
import 'firebase_options.dart';

import 'controllers/user_data_controller.dart';
import 'internal_db/user_info_db_helper.dart';
import 'model/user_model.dart';
import 'screens/login_screen.dart';
import 'themes/myapp_theme.dart';

void main() async {
  // Get.put(UserDataController()); //injecting controller in memory

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  for (var d in [31, 40, 50]) {
    log("=> ${DateTime.now().subtract(Duration(days: d)).millisecondsSinceEpoch}");
  }
  // UserDbHelper.instance.invalidateDB();
  // await AuthService().signOut();

  // await UserDbHelper.instance.insertUser(UserModel(
  //   name: 'TEST USER',
  // ));

  // await UserDbHelper.instance.delete();
  // log("=> uid in main: ${FirebaseAuth.instance.currentUser!.uid}");
  await RealtimeDatabase().fetchCurrentUserInfo();

  InitialBindings().dependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      GetMaterialApp(
        translations: Languages(),
        locale: const Locale('en', 'EN'),
        debugShowCheckedModeBanner: false,
        theme: MyAppTheme().themeData(),
        home: Builder(builder: (context) {
          if (AuthService().isUserSignedIn()) {
            return FutureBuilder<bool>(
                //getting data from internal database
                future: Get.find<UserDataController>().getSetUserInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return const LoadingScreen();
                  }
                  return const HomeScreen();
                });
          }
          return LoginScreen();
        }),
        // initialises Fluttertoast package
        builder: FToastBuilder(),
      ),
    ),
  );
}
