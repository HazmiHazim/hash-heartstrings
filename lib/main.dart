import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/DatePlannerInterface/DatePlannerInterface.dart';
import 'package:hash_heartstring/View/DateQuizInterface/DateQuizInterface.dart';
import 'package:hash_heartstring/View/HomeInterface/HomeInterface.dart';
import 'package:hash_heartstring/View/TruthOrDareInterface/TruthOrDareInterface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HASH Heartstrings',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  int navigationPage = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  final List<Widget> screens = [
    const HomeInterface(),
    const DatePlannerInterface(),
    const DateQuizInterface(),
    const TruthOrDareInterface(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: navigationPage,
        backgroundColor: const Color(0xFFE6E6FA),
        buttonBackgroundColor: const Color(0xFFF8B1C3),
        color: const Color(0xFF87CEEB),
        animationDuration: const Duration(milliseconds: 280),
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.note_alt_outlined, size: 30),
          Icon(Icons.quiz_rounded, size: 30),
          Icon(Icons.games_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            navigationPage = index;
          });
        },
      ),
      body: screens[navigationPage],
    );
  }
}


