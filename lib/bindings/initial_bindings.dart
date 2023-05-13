import 'package:get/get.dart';
import 'package:riddle_leader/controllers/auth_controller.dart';

class InitialBindings implements Bindings{
  @override
  void dependencies(){
    //permanent: true means this controller will be injected in memory permanently
     Get.put(AuthController(), permanent: true);
  }
}