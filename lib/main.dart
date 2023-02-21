import 'package:flutter/material.dart';
import 'package:hash_heartstring/DateGoal/date_goal.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:hash_heartstring/SideBarMenu/main_side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HASH Heartstring',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'HASH Heartstring'),
      //home: date_goal(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(
        title: Text("Happy Birthday Sayangku"),
        centerTitle: true,
      ),
      drawer: mainSideBar(),
    );
  }
}
