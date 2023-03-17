import 'package:flutter/material.dart';

class HomeInterface extends StatefulWidget {
  const HomeInterface({Key? key}) : super(key: key);

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Home',
            style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Color(0xFF87CEEB),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/love2.png'),
          ),
        ],
      ),
    );
  }
}
