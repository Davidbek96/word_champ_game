import 'package:firebase_auth/firebase_auth.dart';

import '../constants/db_column_names.dart';
import '../helpers/date_time_helper.dart';

class UserModel {
  String? uid; //
  String? name; //
  String? email; //
  String? avatarKey; //
  String? country;
  // int? helpCount;
  int? openLevel;
  // int? trophyGold, trophySilver, trophyBronze;
  int? score, levelUpdatedDay; //
  bool? isFirst; //
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.avatarKey,
    this.country,
    // this.helpCount,
    this.openLevel,
    // this.trophyGold,
    // this.trophySilver,
    // this.trophyBronze,
    this.score,
    this.levelUpdatedDay,
    this.isFirst,
  });

  factory UserModel.fromMap(data) {
    return UserModel(
      uid: data[DBColumnUser.uid],
      name: data[DBColumnUser.name],
      email: data[DBColumnUser.email],
      avatarKey: data[DBColumnUser.avatarKey],
      country: data[DBColumnUser.lifeCount],
      // helpCount: data[DBColumnUser.helpCount],
      openLevel: data[DBColumnUser.openLevel],
      // trophyGold: data[DBColumnUser.trophyGold],
      // trophySilver: data[DBColumnUser.trophySilver],
      // trophyBronze: data[DBColumnUser.trophyBronze],
      score: data[DBColumnUser.score],
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
      DBColumnUser.openLevel: user.openLevel,
      DBColumnUser.score: user.score,
      DBColumnUser.levelUpdatedDT: user.levelUpdatedDay,
      DBColumnUser.country: user.country,
    };
  }

  static UserModel get defaultUserData => UserModel(
        name: "User ${DateTime.now().millisecond}${DateTime.now().microsecond}",
        email: FirebaseAuth.instance.currentUser?.email,
        avatarKey: "0",
        country: "Unknown",
        openLevel: 1,
        score: 0,
        levelUpdatedDay:
            DateTimeHerlper.getFormattedDateMillisec(DateTime.now()),
        // coins: 185, // initial coins
      );
}
