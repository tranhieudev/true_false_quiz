import 'package:flutter/material.dart';
import 'package:quiz/views/quiz_play.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context)=> QuizPlay()
            ));
          },
          child: Container(
            padding:EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular( 24),
            ),
            child: Text('Start quiz now'),
          ),
        ),
      ),
    );
  }

}