import 'package:flutter/material.dart';
import 'package:hash_heartstring/BottomNavigationBar/NavigationBar.dart';

void main() {
  runApp(MyApp());
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
      body: navigationBar(),
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
      ),
    );
  }
}

