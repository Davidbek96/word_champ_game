// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/constants/style_constants.dart';
import 'package:riddle_leader/model/user_model.dart';
import 'package:riddle_leader/widgets/gobackbtn_and_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/leaderboard_controller.dart';
import '../controllers/user_data_controller.dart';
import '../widgets/ranking_period_btn.dart';

final LeaderboardController _leaderboardCtrl = Get.find();

class LeaderBoardScreen extends StatelessWidget {
  LeaderBoardScreen({super.key});
  final UserDataController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const GoBackBtnAndTitle(
                icon: Icons.arrow_back, title: 'Leader Board'),
            RankingPeriodBtn(
              allTimePressed: () async {
                _leaderboardCtrl.setSelectedFilter(2);
                await _leaderboardCtrl.getSetLeaderboardPlayers();
              },
              monthPressed: () async {
                _leaderboardCtrl.setSelectedFilter(1);
                await _leaderboardCtrl.getSetLeaderboardPlayers();
              },
              todayPressed: () async {
                _leaderboardCtrl.setSelectedFilter(0);
                await _leaderboardCtrl.getSetLeaderboardPlayers();
              },
            ),

            Obx(
              () => _leaderboardCtrl.loading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(),
            ),

            // if there is no leaderboard players at all
            // show message
            Obx(
              () => _leaderboardCtrl.players.value.top3.isEmpty &&
                      !_leaderboardCtrl.loading.value
                  ? Center(
                      child: Text("No players during this time"),
                    )
                  : SizedBox(),
            ),

            //==========> Top 3 Users in Rank <========
            Obx(() {
              if (_leaderboardCtrl.loading.value) {
                return SizedBox();
              }

              // if there 3 players, player with the highest level is at index 1
              // else player with the highest level is at index 0
              final top3Players = _leaderboardCtrl.players.value.top3;

              var length = top3Players.length;
              // log("Index 0  name=> ${top3Players[0].name}, ${top3Players[0].level}");
              // log("Index 1  name=> ${top3Players[1].name}, ${top3Players[1].level}");
              // log("Index 2  name=> ${top3Players[2].name}, ${top3Players[2].level}");
              //
              return Row(
                children: [
                  if (top3Players.length < 3)
                    buildFirstPlayer(top3Players.first)
                  else
                    buildSecondPlayer(top3Players.first),
                  if (top3Players.length == 3) buildFirstPlayer(top3Players[1]),
                  if (top3Players.length > 1) buildThirdPlayer(top3Players.last)
                ],
              );
            }),

            //==========> Your current rank <==========
            Obx(() {
              if (_leaderboardCtrl.loading.value) return SizedBox();

              return Padding(
                padding: const EdgeInsets.only(
                    right: 14.0, left: 14.0, top: 15.0, bottom: 5.0),
                child: Container(
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: const [Color(0xFF6949FE), Colors.purple],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        // TODO show user's rank
                        Text('You rank  344'),
                        Text('Point  23456'),
                      ],
                    )),
              );
            }),

            //==========> Other users in Rank <========
            Expanded(
              child: Obx(() {
                if (_leaderboardCtrl.loading.value) {
                  return SizedBox();
                }

                final otherPlayers = _leaderboardCtrl.players.value.others;
                if (otherPlayers.isEmpty) {
                  return Center(
                    child: Text("No other players"),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      otherPlayers.length, //TODO - change to string length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 15),
                      child: Row(
                        children: [
                          //Rank number and Avatar
                          Row(
                            children: [
                              Text(
                                index + 4 < 10
                                    ? '0${index + 4}'
                                    : '${index + 4}',
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: kGradientColors[index % 9][0],
                              ),
                            ],
                          ),
                          SizedBox(width: 10),

                          //Name and country
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                otherPlayers[index].name!,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white70),
                              ),
                              Text(
                                otherPlayers[index].country ?? "Unknown",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF4682B4)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '${otherPlayers[index].score}',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildThirdPlayer(UserModel top3Players) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.yellow,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white70,
              foregroundImage: AssetImage(
                'images/user_icons/woman.png',
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  top3Players.name!,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  top3Players.country ?? "Unknown",
                  style: TextStyle(color: Color(0xFF4682B4), fontSize: 12),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                Text(
                  '${top3Players.score}',
                  style: TextStyle(color: Colors.amber),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildFirstPlayer(UserModel top3Players) {
    return Expanded(
      child: Column(
        children: [
          Column(
            children: const [
              Icon(
                FontAwesomeIcons.crown,
                color: Colors.amber,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.amber,
                  foregroundImage: AssetImage(
                    'images/user_icons/batman.png',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  top3Players.name!,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  top3Players.country ?? "Unknown",
                  style: TextStyle(color: Color(0xFF4682B4), fontSize: 12),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                Text(
                  '${top3Players.score}',
                  style: TextStyle(color: Colors.amber),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildSecondPlayer(UserModel top3Players) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.yellow,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white70,
              foregroundImage: AssetImage(
                'images/user_icons/man.png',
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  top3Players.name!,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  top3Players.country ?? "Unknown",
                  style: TextStyle(color: Color(0xFF4682B4), fontSize: 12),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
                Text(
                  '${top3Players.score}',
                  style: TextStyle(color: Colors.amber),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
