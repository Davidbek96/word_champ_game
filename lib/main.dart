import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riddle_leader/bindings/initial_bindings.dart';
import 'package:riddle_leader/routes/app_routes.dart';
import 'package:riddle_leader/screens/introduction/introduction.dart';
import 'firebase_options.dart';

import 'controllers/user_data_controller.dart';
import 'screens/login_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'themes/myapp_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //goes to the first route in named routes in Routes
      getPages: AppRoutes.routes(),
    );
  }
}

//TODO - I should use this main screen later
// void main() async {
//   Get.put(UserDataController()); //injecting controller in memory
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then(
//     (value) => runApp(
//       GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: MyAppTheme().themeData(),
//         home: const LoginScreen(),
//       ),
//     ),
//   );
// }
