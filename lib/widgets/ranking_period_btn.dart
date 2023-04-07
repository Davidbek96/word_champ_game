import 'package:flutter/material.dart';

class RankingPeriodBtn extends StatefulWidget {
  const RankingPeriodBtn({
    required this.allTimePressed,
    required this.monthPressed,
    required this.todayPressed,
    Key? key,
  }) : super(key: key);

  final Function() allTimePressed;
  final Function() monthPressed;
  final Function() todayPressed;

  @override
  State<RankingPeriodBtn> createState() => _RankingPeriodBtnState();
}

class _RankingPeriodBtnState extends State<RankingPeriodBtn> {
  int choosenRankPeriod = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF27275E),
      ),
      height: 35.0,
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    choosenRankPeriod == 0 ? Colors.white : Color(0xFF27275E),
              ),
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'All time',
                  style: TextStyle(
                    color: choosenRankPeriod == 0
                        ? Color(0xFF27275E)
                        : Colors.white54,
                  ),
                ),
                onPressed: () {
                  widget.allTimePressed;
                  setState(() {
                    choosenRankPeriod = 0;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    choosenRankPeriod == 1 ? Colors.white : Color(0xFF27275E),
              ),
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'Month',
                  style: TextStyle(
                    color: choosenRankPeriod == 1
                        ? Color(0xFF27275E)
                        : Colors.white54,
                  ),
                ),
                onPressed: () {
                  widget.monthPressed;
                  setState(() {
                    choosenRankPeriod = 1;
                  });
                  //widget.c.rankPeriodBtnID.value = 0;
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    choosenRankPeriod == 2 ? Colors.white : Color(0xFF27275E),
              ),
              alignment: Alignment.center,
              child: TextButton(
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: choosenRankPeriod == 2
                        ? Color(0xFF27275E)
                        : Colors.white54,
                  ),
                ),
                onPressed: () {
                  widget.todayPressed;
                  setState(() {
                    choosenRankPeriod = 2;
                  });
                  //widget.c.rankPeriodBtnID.value = 0;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}