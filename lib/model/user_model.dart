import 'package:firebase_auth/firebase_auth.dart';

import '../constants/db_column_names.dart';
import '../helpers/date_time_helper.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? avatarKey;
  int? lifeCount;
  int? helpCount;
  int? coins;
  int? trophyGold, trophySilver, trophyBronze;
  int? level, levelUpdatedDay;
  bool? isFirst;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.avatarKey,
    this.lifeCount,
    this.helpCount,
    this.coins,
    this.trophyGold,
    this.trophySilver,
    this.trophyBronze,
    this.level,
    this.levelUpdatedDay,
    this.isFirst,
  });

  factory UserModel.fromMap(data) {
    return UserModel(
      uid: data[DBColumnUser.uid],
      name: data[DBColumnUser.name],
      email: data[DBColumnUser.email],
      avatarKey: data[DBColumnUser.avatarKey],
      lifeCount: data[DBColumnUser.lifeCount],
      helpCount: data[DBColumnUser.helpCount],
      coins: data[DBColumnUser.coins],
      trophyGold: data[DBColumnUser.trophyGold],
      trophySilver: data[DBColumnUser.trophySilver],
      trophyBronze: data[DBColumnUser.trophyBronze],
      level: data[DBColumnUser.level],
      levelUpdatedDay: data[DBColumnUser.levelUpdatedDT],
    );
  }

  static Map<String, dynamic> toMap(UserModel user) {
    return {
      // DBColumnUser.uid: user.uid,
      DBColumnUser.name: user.name,
      // DBColumnUser.email: user.email,
      // DBColumnUser.avatarKey: user.avatarKey,
      // DBColumnUser.lifeCount: user.lifeCount,
      // DBColumnUser.helpCount: user.helpCount,
      // DBColumnUser.coins: user.coins,
      // DBColumnUser.trophyGold: user.trophyGold,
      // DBColumnUser.trophySilver: user.trophySilver,
      // DBColumnUser.trophyBronze: user.trophyBronze,
      // DBColumnUser.level: user.level,
      // DBColumnUser.levelUpdatedDT: user.levelUpdatedDay,
    };
  }

  static Map<String, dynamic> toFirebaseDBMap(UserModel user) {
    return {
      DBColumnUser.uid: user.uid,
      DBColumnUser.name: user.name,
      DBColumnUser.email: user.email,
      DBColumnUser.avatarKey: user.avatarKey,
      DBColumnUser.level: user.level,
      DBColumnUser.levelUpdatedDT: user.levelUpdatedDay,
    };
  }

  static UserModel get defaultUserData => UserModel(
        name: "User ${DateTime.now().millisecond}${DateTime.now().microsecond}",
        email: FirebaseAuth.instance.currentUser?.email,
        avatarKey: "0",
        lifeCount: 3,
        helpCount: 5,
        level: 1,
        levelUpdatedDay:
            DateTimeHerlper.getFormattedDateMillisec(DateTime.now()),
        coins: 185, // initial coins
      );
}
