import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/DateActivityInterface/DateActivityInterface.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async{
  //Initialize Hive Database
  await Hive.initFlutter();

  //Open Hive Box
  await Hive.openBox('DateActivity');

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
      home: const DateActivityInterface(),
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
      appBar: AppBar(title: Text('Main Page')),
    );
  }
}

