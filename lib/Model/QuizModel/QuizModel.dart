import 'package:flutter/material.dart';

class QuizModel {
  String pilihanJawapan;
  Color answerColor;
  Function() answerClick;

  QuizModel({
    required this.pilihanJawapan,
    required this.answerColor,
    required this.answerClick
  });
}