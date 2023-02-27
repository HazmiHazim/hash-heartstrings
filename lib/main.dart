import 'package:flutter/material.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hash_heartstring/SideBarMenu/main_side_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async{
  //Initialize Hive Database
  await Hive.initFlutter();
  Hive.registerAdapter<DateActivityModel>(DateActivityModelAdapter());

  //Open Hive Box
  var dateActivityBox = await Hive.openBox('DateActivity');
  
  //Delete data from previous day
  dateActivityBox.values.forEach((DateActivityModel) {
    if(DateActivityModel.createdAt.day != DateTime.now().day) {
      dateActivityBox.delete(DateActivityModel.id);
    }
  });
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
      backgroundColor: const Color(0xFFF8B1C3),
      appBar: AppBar(
        title: const Text("Happy Birthday Sayangku"),
        centerTitle: true,
      ),
      drawer: const mainSideBar(),
    );
  }
}
