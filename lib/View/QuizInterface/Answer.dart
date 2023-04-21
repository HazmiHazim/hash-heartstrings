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
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: quizModel.answerColor,
          border: Border.all(color: const Color(0xFFFF69B4)),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Text(
          quizModel.pilihanJawapan,
          style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
