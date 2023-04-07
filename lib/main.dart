import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/user_data_controller.dart';
import 'screens/login_screen.dart';
import 'themes/myapp_theme.dart';

void main() {
   Get.put(UserDataGetx()); //injecting controller in memory

  WidgetsFlutterBinding.ensureInitialized();
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
