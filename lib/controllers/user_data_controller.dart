import 'package:get/get.dart';
import 'package:riddle_leader/internal_db/user_info_db_helper.dart';
import 'package:riddle_leader/model/user_model.dart';

class UserDataController extends GetxController {
  final userInfo = UserModel().obs;
  // var userLevel = 0.obs; //TODO - Testing
  // var finishedQuizPercentage = 20; //TODO - Testing
  // var rankPeriodBtnID = 0.obs;

  Future<bool> getSetUserInfo() async {
    final user = await UserDbHelper.instance.getUser();
    if (user != null) {
      userInfo.value = user;
    }
    return true;
  }

  void setUserInfo(UserModel user) {
    userInfo.value = user;
  }
}
