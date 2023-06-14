import '/model/user_model.dart';

class LeaderBoardModel {
  List<UserModel> top3;
  List<UserModel> others;
  // int currentUserPosition;
  LeaderBoardModel({
    required this.top3,
    required this.others,
    // required this.currentUserPosition,
  });
}
