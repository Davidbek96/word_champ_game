import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riddle_leader/controllers/auth_controller.dart';
import 'package:riddle_leader/controllers/user_data_controller.dart';

final UserDataController _userDataCtrl = Get.find();

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
          const SizedBox(height: 16),
          Obx(
            () => Text(
              _userDataCtrl.userInfo.value.name ?? "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'david.sejong@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const Text(
            "Score: 12400",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 16),
          const Text(
            'Language Learning Progress',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const SizedBox(height: 16),
          const Text(
            'Achievements',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              Chip(
                label: Text('Beginner'),
                backgroundColor: Colors.blueGrey,
              ),
              Chip(
                label: Text('Intermediate'),
                backgroundColor: Colors.blueGrey,
              ),
              Chip(
                label: Text('Advanced'),
                backgroundColor: Colors.purple,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          ElevatedButton(
            onPressed: Get.find<AuthController>().signOut,
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
