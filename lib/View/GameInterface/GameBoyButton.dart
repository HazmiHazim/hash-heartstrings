import 'package:flutter/material.dart';

class GameBoyButton extends StatelessWidget {

  final text;
  final function;

  GameBoyButton({
    this.text,
    this.function
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.black
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
