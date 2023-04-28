import 'package:flutter/material.dart';
import 'package:riddle_leader/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 16),
            Text(
              'David Student',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'david.sejong@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            Text(
              "Score: 12400",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            SizedBox(height: 16),
            Text(
              'Language Learning Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
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
            Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
