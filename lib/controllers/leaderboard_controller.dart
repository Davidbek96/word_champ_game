import 'package:get/state_manager.dart';

import '../model/leaderboard_model.dart';
import '../services/realtime_database.dart';

class LeaderboardController extends GetxController {
  Rx<LeaderBoardModel> players = LeaderBoardModel(top3: [], others: []).obs;
  // 0: today; 1: this week; 2: all time;
  RxInt selectedFilter = 2.obs;
  RxBool loading = false.obs;

  setSelectedFilter(int value) {
    selectedFilter.value = value;
  }

  getSetLeaderboardPlayers() async {
    loading.value = true;

    int? filterDateInt;
    if (selectedFilter.value == 0) {
      // today's rank
      filterDateInt = 1;
    } else if (selectedFilter.value == 1) {
      // this month's rank
      filterDateInt = 30;
    }

    final playersData =
        await RealtimeDatabase().getLeaderboardPlayers(filterDateInt);
    if (playersData != null) {
      players.value = playersData;
    } else {
      players.value = LeaderBoardModel(top3: [], others: []);
    }

    loading.value = false;
  }
}
