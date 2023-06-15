import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GoBackBtnAndTitle extends StatelessWidget {
  const GoBackBtnAndTitle({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          iconSize: 25,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF37E9BB),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
      ]),
    );
  }
}
