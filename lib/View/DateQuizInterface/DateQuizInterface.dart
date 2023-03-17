import 'package:flutter/material.dart';

class DateQuizInterface extends StatefulWidget {
  const DateQuizInterface({Key? key}) : super(key: key);

  @override
  State<DateQuizInterface> createState() => _DateQuizInterfaceState();
}

class _DateQuizInterfaceState extends State<DateQuizInterface> {
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
