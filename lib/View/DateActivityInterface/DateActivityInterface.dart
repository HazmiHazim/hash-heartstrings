import 'package:flutter/material.dart';
import 'package:hash_heartstring/View/BottomNavigationBar/BottomNavigationBar.dart';

class DateActivityInterface extends StatefulWidget {
  const DateActivityInterface({Key? key}) : super(key: key);

  @override
  State<DateActivityInterface> createState() => _DateActivityInterfaceState();
}

class _DateActivityInterfaceState extends State<DateActivityInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF69B4),
        title: Text(
            'Date Activity To Do',
            style: TextStyle(color: Color(0xFFE6E6FA))
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
