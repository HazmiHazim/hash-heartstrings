import 'package:flutter/material.dart';

class QuizInterface extends StatefulWidget {
  const QuizInterface({Key? key}) : super(key: key);

  @override
  State<QuizInterface> createState() => _QuizInterfaceState();
}

class _QuizInterfaceState extends State<QuizInterface> {
  List<Icon> scoreTracker = [];
  int questionIndex = 0;
  int totalScore = 0;

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
            Row(
              children: [
                if(scoreTracker.length == 0)
                  SizedBox(height: 50),
                if (scoreTracker.length > 0)
                  ...scoreTracker,
              ],
            ),
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
                  question[questionIndex]['soalan'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Answer Scheme', style: TextStyle(fontSize: 15)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Answer Scheme', style: TextStyle(fontSize: 15)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Answer Scheme', style: TextStyle(fontSize: 15)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Answer Scheme', style: TextStyle(fontSize: 15)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Answer Scheme', style: TextStyle(fontSize: 15)),
              ),
            ),
            //Event occur when user complete 1 question
            Container(
              padding: EdgeInsets.all(20),
              child: Text('0/10', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  final question = const [
    {
      'soalan': 'Hazim suka makan apa?',
      'jawapan': [
        {'pilihanJawapan': 'Nasi Kandar Kuah Campuq', 'score': false},
        {'pilihanJawapan': 'Nasi Goreng U.S.A', 'score': false},
        {'pilihanJawapan': 'Nasi Ayam', 'score': true},
        {'pilihanJawapan': 'Nasi Goreng Lamb Chop', 'score': false},
        {'pilihanJawapan': 'Nasi Putih Ayam Buttermilk', 'score': false},
      ],
    },
    {
      'soalan': 'Hazim suka minum aoa?',
      'jawapan': [
        {'pilihanJawapan': 'Milo Ais Mamak', 'score': false},
        {'pilihanJawapan': 'Teh Ais Sedap', 'score': false},
        {'pilihanJawapan': 'Neslo Ais', 'score': false},
        {'pilihanJawapan': 'Starbucks', 'score': false},
        {'pilihanJawapan': 'Teh Ais Mamak', 'score': true},
      ]
    }
  ];
}
