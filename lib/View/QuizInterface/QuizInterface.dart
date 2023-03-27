import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/QuizModel/QuizModel.dart';
import 'package:hash_heartstring/View/QuizInterface/Answer.dart';
import 'package:hash_heartstring/Model/QuizModel/Question.dart';
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

    if (quizEnd) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: const Color(0xFFE6E6FA),
          title: Container(
            alignment: Alignment.center,
            child: LiquidCustomProgressIndicator(
              value: loveProgress,
              direction: Axis.vertical,
              shapePath: heartContainer(),
              center: Text('${love.toStringAsFixed(2)}%'),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                if (love >= 70)
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF81C784),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 11.5,
                          child: Container(
                            width: 24,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (love >= 50 && love < 70)
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFEE58),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 11.5,
                          child: Container(
                            width: 24,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (love < 50)
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 7,
                            top: 13,
                            child: Transform.rotate(
                              angle: 35,
                              child: Container(
                                width: 16,
                                height: 4,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            right: 7,
                            top: 13,
                            child: Transform.rotate(
                              angle: -35,
                              child: Container(
                                width: 16,
                                height: 4,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                        ),
                        Positioned(
                          left: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 16,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 11.5,
                          child: Container(
                            width: 24,
                            height: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              ),
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (love >= 70)
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                        '🎉🎉🎉 Tahniah Anda Telah Berjaya Mengenali Hazmi Hazim Sepenuhnya. Sila Screenshot Ini Dan Send Sebagai Bukti Anda Menyayanginya🎉🎉🎉\n♥♥♥',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ),
                if (love >= 50 && love < 70)
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Awak Sayang Saya Banyak Ni Je ? Takpelah, Okay la Dari Tak Sayang ♥',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ),
                if (love < 50)
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Awak Kene Kahwin Ngan Saya Cepat Ni.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    autofocus: true,
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          )
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
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF87CEEB),
        title: const Text(
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
              margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFF69B4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  Question.question[questionIndex]['soalan'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
              padding: const EdgeInsets.all(20),
              child: Text('${totalScore.toString()}/${Question.question.length}', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
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
