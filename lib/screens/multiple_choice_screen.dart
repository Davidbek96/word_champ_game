import 'package:flutter/material.dart';

class MultipleChoiceScreen extends StatelessWidget {
const MultipleChoiceScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is Multiple Choice Questions Screen',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold) ,),
        ),
      ),
    );
  }
}