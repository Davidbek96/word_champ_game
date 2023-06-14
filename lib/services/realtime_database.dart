import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../constants/db_column_names.dart';
import '../model/leaderboard_model.dart';
import '../model/user_model.dart';

class RealtimeDatabase {
  Future<void> setUserData(
    UserModel userdata, {
    bool addUpdatedDT = false,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    // set uid here, coz uid might not be passed with userdata to this function
    userdata.uid = user.uid;

    FirebaseDatabase database = FirebaseDatabase.instance;
    await database
        .ref("users/${user.uid}")
        // .ref("users/${DateTime.now().millisecondsSinceEpoch}")
        .set(UserModel.toFirebaseDBMap(userdata));
  }

  Future<LeaderBoardModel?> getLeaderboardPlayers(int? daysAgo) async {
    // wait 3 seconds for lottie animation complete
    await Future.delayed(const Duration(seconds: 3));

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    final ref = FirebaseDatabase.instance.ref();
    // fetch all data

    const maxLevelUpdatedDays = 90;
    final startTimestamp = DateTime.now()
        .subtract(Duration(days: daysAgo ?? maxLevelUpdatedDays))
        .millisecondsSinceEpoch;
    final endTimestamp = DateTime.now().millisecondsSinceEpoch;

    // get daily/weekly/alltime
    // * user's levelUpdatedDT value should be less than 90 days
    final snapshot = await ref
        .child('users')
        .orderByChild(DBColumnUser.levelUpdatedDT)
        .startAt(startTimestamp)
        .endAt(endTimestamp)
        .get();

    // log("===> snapshot: ${snapshot.children.toList()}");
    if (snapshot.exists) {
      final List<DataSnapshot> playersData = snapshot.children.toList();
      final players = List.generate(
        playersData.length,
        (index) => UserModel.fromMap(playersData[index].value),
      );
      // sort by level
      players.sort((a, b) => b.level!.compareTo(a.level!));

      List<UserModel> top3 = [];
      List<UserModel> others = [];
      for (var p in players) {
        if (top3.length < 3) {
          if (top3.length == 1) {
            // user with the highest level
            top3.first.isFirst = true;
          }
          top3.add(p);
        } else {
          others.add(p);
        }
      }

      if (top3.length == 3) {
        // insert first player in the middle
        // for the UI case
        final first = top3.first;
        top3.removeAt(0);
        top3.insert(1, first);
      }

      // #########################
      var leaderboardPlayers = [];
      leaderboardPlayers.addAll(top3);
      leaderboardPlayers.addAll(others);

      // add all users to leaderboard model
      var leaderboards = LeaderBoardModel(
        top3: top3,
        others: others,
        // currentUserPosition: currentUserPosition,
      );
      return leaderboards;
    } else {
      log('No data available.');
      return null;
    }
  }

  // ##########################################
  Future<void> deleteUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      FirebaseDatabase database = FirebaseDatabase.instance;
      await database.ref("users").child(user.uid).remove();
    } catch (e) {
      throw Exception(e);
    }
  }
}
