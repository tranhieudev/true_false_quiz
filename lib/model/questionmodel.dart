import 'package:quiz/data/data.dart';

class QuestionModel{

  String question;
  String answer;
  String imageUrl;

  QuestionModel({this.question, this.answer, this.imageUrl});

  void setQuestion(String question){
    this.question=question;
  }

  void setAnswer(String answer){
    this.answer = answer;
  }

  void setImageUrl(String imagUrl){
    this.imageUrl = imagUrl;
  }

  String getQuestion(){
    return this.question;
  }

  String getAnswer(){
    return this.answer;
  }

  String getImageUrl(){
    return this.imageUrl;
  }
}