import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/model/questionmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quiz/views/result.dart';

class QuizPlay extends StatefulWidget {

  @override
  QuizPlayState createState() => QuizPlayState();

}

class QuizPlayState extends State<QuizPlay>
    with SingleTickerProviderStateMixin {
  List<QuestionModel> _question = new List<QuestionModel>();
  int index = 0;
  int correct = 0, incorrect = 0, notAttemped = 0, point = 0;

  Animation animation;
  AnimationController animationController;
  double beginAnimation = 0.0;
  double endAnimation = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _question = getQuestion();

    animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this)..addListener((){
          setState(() {
          });
        });
    animation = Tween(begin: beginAnimation, end: endAnimation)
        .animate(animationController);
    startAnimation();
    animationController.addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        setState(() {
          if(index<_question.length-1){
            index++;
            resetAinimation();
            startAnimation();
            notAttemped++;
          }
          else{
            notAttemped++;
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) =>Result(
                  score: point,
                  totaQuestion: _question.length,
                  correct: correct,
                  incorrect: incorrect,
                  notAttempted: notAttemped,
                )
            ));
          }
        });
      }
    });
  }

  startAnimation(){
    animationController.forward();
  }

  resetAinimation(){
    animationController.reset();
  }

  stopAnimation(){
    animationController.stop();
  }
  void nextQuestion(){
    if (index < _question.length - 1) {
      index++;
      resetAinimation();
      startAnimation();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                score: point,
                totaQuestion: _question.length,
                correct: correct,
                incorrect: incorrect,
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${index + 1}/${_question.length}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Question",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    "$point",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Point",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(height: 40,),

            Text(
              "${_question[index].getQuestion()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            LinearProgressIndicator(
              value: animation.value,
            ),
            CachedNetworkImage(
              imageUrl: _question[index].getImageUrl(),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(_question[index].getAnswer()=="Yes"){
                          setState(() {
                            point=point+20;
                            correct++;
                            nextQuestion();
                          });
                        }
                        else{
                          point =point -5;
                          incorrect++;
                          nextQuestion();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        alignment: Alignment.center,
                        child: Text(
                          "True",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.blue),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 20,
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(_question[index].getAnswer()=="No"){
                          setState(() {
                            point=point+20;
                            index++;
                            correct++;
                            resetAinimation();
                            startAnimation();
                          });
                        }
                        else{
                          point =point -5;
                          index ++;
                          incorrect++;
                          resetAinimation();
                          startAnimation();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        alignment: Alignment.center,
                        child: Text(
                          "False",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
