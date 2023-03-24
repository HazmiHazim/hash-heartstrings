import 'package:flutter/material.dart';

class Battleground extends StatelessWidget {
  const Battleground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Grass-Battle-Ground.png',
            width: MediaQuery.of(context).size.width - 30,
            fit: BoxFit.cover,
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
