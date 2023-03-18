import 'package:flutter/material.dart';

class QuizInterface extends StatefulWidget {
  const QuizInterface({Key? key}) : super(key: key);

  @override
  State<QuizInterface> createState() => _QuizInterfaceState();
}

class _QuizInterfaceState extends State<QuizInterface> {
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
    );
  }
}
