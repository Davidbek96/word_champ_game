import 'package:get/get.dart';
import 'package:riddle_leader/screens/introduction/introduction.dart';
import 'package:riddle_leader/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
      ];
}
