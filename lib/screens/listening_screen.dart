import 'package:flutter/material.dart';

class ListeningScreen extends StatelessWidget {
const ListeningScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is Listening Screen',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold) ,),
        ),
      ),
    );
  }
}