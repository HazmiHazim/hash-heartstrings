import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/QuizModel/QuizModel.dart';

class Answer extends StatelessWidget {

  final QuizModel quizModel;

  Answer({
    required this.quizModel
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: quizModel.answerClick,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: quizModel.answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          quizModel.pilihanJawapan,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
