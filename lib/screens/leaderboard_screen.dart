// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/constants/style_constants.dart';
import 'package:riddle_leader/widgets/gobackbtn_and_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/user_data_controller.dart';
import '../widgets/ranking_period_btn.dart';

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
              allTimePressed: () {},
              monthPressed: () {},
              todayPressed: () {},
            ),

            //==========> Top 3 Users in Rank <========
            Row(
              children: [
                Expanded(
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
                      //TODO - Shorten top 3 user details to a custom widget
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: const [
                            Text(
                              'Atakhanov Akbarjon',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              'United States',
                              style: TextStyle(
                                  color: Color(0xFF4682B4), fontSize: 12),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            Text(
                              '67345',
                              style: TextStyle(color: Colors.amber),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                          children: const [
                            Text(
                              'Ibragimov Dostonbek',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              'Uzbekistan',
                              style: TextStyle(
                                  color: Color(0xFF4682B4), fontSize: 12),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            Text(
                              '67345',
                              style: TextStyle(color: Colors.amber),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                          children: const [
                            Text(
                              'Isabella',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              'United Kingdom',
                              style: TextStyle(
                                  color: Color(0xFF4682B4), fontSize: 12),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            Text(
                              '67345',
                              style: TextStyle(color: Colors.amber),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //==========> Your current rank <==========
            Padding(
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
                      colors: [Color(0xFF6949FE), Colors.purple],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('You rank  344'),
                      Text('Point  23456'),
                    ],
                  )),
            ),

            //==========> Other users in Rank <========
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 97, //TODO - change to string length,
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
                              index + 4 < 10 ? '0${index + 4}' : '${index + 4}',
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
                              index % 2 == 0
                                  ? 'Dovudjon Usmonov'
                                  : index % 3 == 0
                                      ? 'Wilson'
                                      : 'James Smith',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white70),
                            ),
                            Text(
                              index % 2 == 0
                                  ? 'South Korea'
                                  : index % 3 == 0
                                      ? 'France'
                                      : 'Australia',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF4682B4)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '${50000 - (index * 757)}',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
