import 'package:get/get.dart';
//we need this controller for user authentication and routing
class AuthController extends GetxController{
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }

  void initAuth()async{
    //wait for 2 seconds to go from Splash Screen to Introduction Screen
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }
  
  //we need this function to navigate from SplashScreen to Introduction Screen 
  //after 2 seconds
  void navigateToIntroduction(){
    //remove all the screens and go to Introduction screen
    Get.offAllNamed("/introduction");
  }
}