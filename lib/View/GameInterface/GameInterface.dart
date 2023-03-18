import 'package:flutter/material.dart';

class GameInterface extends StatefulWidget {
  const GameInterface({Key? key}) : super(key: key);

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text(
            'Hazim x Aishah Game',
            style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,
      ),
    );
  }
}
