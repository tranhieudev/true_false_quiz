import 'package:quiz/model/questionmodel.dart';

List<QuestionModel> getQuestion() {
  List<QuestionModel> question = new List<QuestionModel>();
  QuestionModel questionModel = new QuestionModel();
  questionModel.setQuestion("Are you girl?");
  questionModel.setAnswer("Yes");
  questionModel.setImageUrl(
      "https://sohanews.sohacdn.com/2017/cuoc-song-5-1511749924279.jpg");
  question.add(questionModel);

  //2
  questionModel = new QuestionModel();
  questionModel.setQuestion("Is this a tiger?");
  questionModel.setAnswer("Yes");
  questionModel.setImageUrl(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Winter_chill_%284263376940%29.jpg/1280px-Winter_chill_%284263376940%29.jpg");
  question.add(questionModel);

  //3
  questionModel = new QuestionModel();
  questionModel.setQuestion("Is this a cat?");
  questionModel.setAnswer("Yes");
  questionModel.setImageUrl(
      "https://znews-photo.zadn.vn/w660/Uploaded/bpmoqwq1/2014_10_16/con_meo.jpg");
  question.add(questionModel);

  //4
  questionModel = new QuestionModel();
  questionModel.setQuestion("Is this a dog?");
  questionModel.setAnswer("Yes");
  questionModel.setImageUrl(
      "https://baogiadinhso.com/wp-content/uploads/2019/11/bai-van-ta-con-cho-dan-y-ta-con-cho-cho-hoc-sinh-tieu-hoc-022.jpg");
  question.add(questionModel);

  //5
  questionModel = new QuestionModel();
  questionModel.setQuestion("Is this a cow?");
  questionModel.setAnswer("Yes");
  questionModel.setImageUrl(
      "https://ketqua247.com/public/media/thumb/news/mo-thay-bo-1-600x314.jpg");
  question.add(questionModel);



  return question;
}
