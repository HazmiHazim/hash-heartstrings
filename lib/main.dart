import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/BottomNavigationBar/BottomNavigationBar.dart';

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
      title: 'HASH Heartstring',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Home',
            style: TextStyle(color: Color(0xFFE6E6FA))
        ),
        backgroundColor: Color(0xFFFF69B4),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}

