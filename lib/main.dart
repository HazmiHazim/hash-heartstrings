import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/DateActivityController.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hash_heartstring/SideBarMenu/main_side_bar.dart';
import 'package:hash_heartstring/View/DateActivityInterface/DateActivityInterface.dart';
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
  runApp(BaseWidget(child: MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({required this.child}) : super(child: child);
  final DateActivityController DateActivityStore = DateActivityController();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    }
    else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HASH Heartstring',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DateActivityInterface(),
      //home: date_goal(),
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
    return const Scaffold(backgroundColor: Color(0xFFF8B1C3),);
  }
}

