import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riddle_leader/bindings/initial_bindings.dart';
import 'package:riddle_leader/screens/loading_screen/lodaing_screen.dart';
import 'package:riddle_leader/screens/home_screen/home_screen.dart';
import 'package:riddle_leader/services/auth.dart';
import 'firebase_options.dart';

import 'controllers/user_data_controller.dart';
import 'screens/login_screen.dart';
import 'themes/myapp_theme.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   InitialBindings().dependencies();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       //goes to the first route in named routes in Routes
//       getPages: AppRoutes.routes(),
//     );
//   }
// }

// TODO - I should use this main screen later
void main() async {
  // Get.put(UserDataController()); //injecting controller in memory

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await UserDbHelper.instance.insertUser(UserModel(
  //   name: 'David',
  // ));
  InitialBindings().dependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      GetMaterialApp(
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
          return const LoginScreen();
        }),
        // initialises Fluttertoast package
        builder: FToastBuilder(),
      ),
    ),
  );
}
