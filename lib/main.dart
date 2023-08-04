import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/DatePlannerInterface/DatePlannerInterface.dart';
import 'package:hash_heartstring/View/GameInterface/GameInterface.dart';
import 'package:hash_heartstring/View/HomeInterface/HomeInterface.dart';
import 'package:hash_heartstring/View/QuizInterface/QuizInterface.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase
  await Firebase.initializeApp();

  runApp(MyApp());
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
    const QuizInterface(),
    const GameInterface(),
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
          Icon(EvaIcons.heart, size: 30),
          Icon(Icons.quiz_rounded, size: 30),
          Icon(Icons.gamepad_sharp, size: 30),
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


