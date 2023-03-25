import 'package:flutter/material.dart';

class Battleground extends StatefulWidget {
  const Battleground({Key? key}) : super(key: key);

  @override
  State<Battleground> createState() => _BattlegroundState();
}

class _BattlegroundState extends State<Battleground> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/Grass-Battle-Ground.png',
                width: MediaQuery.of(context).size.width - 30,
                fit: BoxFit.cover,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 3),
                curve: Curves.easeInOut,
                child: Image.asset('assets/images/Boy.png', width: 120, height: 120),
              ),
            ],
          ),
          Image.asset(
            'assets/images/Battle-Box.png',
            width: MediaQuery.of(context).size.width - 30,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

