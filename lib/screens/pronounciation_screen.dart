import 'package:flutter/material.dart';

class PronounciationScreen extends StatelessWidget {
  const PronounciationScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is Pronounciation Screen',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold) ,),
        ),
      ),
    );
  }
}