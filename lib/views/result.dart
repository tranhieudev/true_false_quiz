import 'package:flutter/material.dart';
import 'package:quiz/views/quiz_play.dart';

class Result extends StatefulWidget {
  int score, totaQuestion, correct, incorrect, notAttempted;

  Result(
      {this.score,
      this.totaQuestion,
      this.correct,
      this.incorrect,
      this.notAttempted});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";

  initState() {
    var percentage = (widget.score / (widget.totaQuestion * 20)) * 100;

    if (percentage >= 90) {
      greeting = "OutStand";
    } else {
      if (percentage >= 80) {
        greeting = "Good Word";
      } else {
        if (percentage >= 70) {
          greeting = "good effort";
        } else
          greeting = "Need improvement";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${greeting}",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You scope ${widget.score} out of ${widget.totaQuestion * 20}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${widget.score} Correct, ${widget.incorrect} Incorrect & ${widget.notAttempted} NotAttempted out of "
              "${widget.totaQuestion}", style:  TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => QuizPlay()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
                child: Text(
                  "Replay Quiz Now",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                child: Text("Go to home"),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
