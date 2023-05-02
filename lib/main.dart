import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'controllers/user_data_controller.dart';
import 'screens/login_screen.dart';
import 'themes/myapp_theme.dart';

void main() async {
  Get.put(UserDataController()); //injecting controller in memory
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyAppTheme().themeData(),
        home: const LoginScreen(),
      ),
    ),
  );
}
