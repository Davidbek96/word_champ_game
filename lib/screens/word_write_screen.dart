import 'package:flutter/material.dart';

class WordWriteScreen extends StatelessWidget {
const WordWriteScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is Word-Write Screen',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold) ,),
        ),
      ),
    );
  }
}