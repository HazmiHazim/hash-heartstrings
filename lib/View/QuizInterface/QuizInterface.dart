import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/QuizModel/QuizModel.dart';
import 'package:hash_heartstring/View/QuizInterface/Answer.dart';
import 'package:hash_heartstring/Controller/QuizController/Question.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class QuizInterface extends StatefulWidget {
  const QuizInterface({Key? key}) : super(key: key);

  @override
  State<QuizInterface> createState() => _QuizInterfaceState();
}

class _QuizInterfaceState extends State<QuizInterface> {

  int questionIndex = 0;
  int totalScore = 0;
  bool answerIsSelected = false;
  bool quizEnd = false;

  //Create Logic When User Answer The Question
  void questionAnswered(bool answerScore) {
    setState(() {
      // Answer is Selected
      answerIsSelected = true;
      //Check if the answer is correct
      if (answerScore) {
        totalScore = totalScore + 1;
      }
    });

    //Make Sure The Score Is Reset When All Question is Answered
    if (questionIndex + 1 == Question.question.length) {
      quizEnd = true;
    }
  }

  void nextQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
      answerIsSelected = false;
    });

    double love = (totalScore / Question.question.length) * 100;
    double loveProgress = love / 100;
    double progressValue = 0;

    if (quizEnd) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Color(0xFFE6E6FA),
          title: Container(
            alignment: Alignment.center,
            child: LiquidCustomProgressIndicator(
              value: loveProgress,
              direction: Axis.vertical,
              shapePath: heartContainer(),
              center: Text('${love.toStringAsFixed(2)}%'),
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              autofocus: true,
              child: Text('Close'),
            ),
          ),
        )
      );
    }

    if (questionIndex >= Question.question.length) {
      questionIndex = 0;
      totalScore = 0;
      quizEnd = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text(
            'Love Quiz',
            style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFF69B4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  Question.question[questionIndex]['soalan'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            ...((Question.question[questionIndex]['jawapan'] as List<Map<String, Object>>)
                .map((jawapan) => Answer(
              quizModel: QuizModel(
                pilihanJawapan: jawapan['pilihanJawapan'] as String,
                answerColor: answerIsSelected ? jawapan['score'] as bool ? Colors.green : Colors.red : Colors.transparent,
                answerClick: (){
                  if (answerIsSelected){
                    return;
                  }
                  //Select The Answer And Give The Score
                  questionAnswered(jawapan['score'] as bool);
                },
              )
            ))).toList(),
            //Event occur when user complete 1 question
            Container(
              padding: EdgeInsets.all(20),
              child: Text('${totalScore.toString()}/${Question.question.length}', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
            //Button Next Page is Shown When User Finish Answer the Question
            if (answerIsSelected)
              ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: quizEnd ? const Text('See Your Love Level') : const Text('Next Question'),
              ),
          ],
        ),
      ),
    );
  }

  Path heartContainer() {
    return Path()
        ..moveTo(55, 15)
        ..cubicTo(55, 12, 50, 0, 30, 0)
        ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
        ..cubicTo(0, 55, 20, 77, 55, 95)
        ..cubicTo(90, 77, 110, 55, 110, 37.5)
        ..cubicTo(110, 37.5, 110, 0, 80, 0)
        ..cubicTo(65, 0, 55, 12, 55, 15)
        ..close();
  }
}