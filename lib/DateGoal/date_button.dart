import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DateButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, color: Colors.pink, child: Text(text),);
  }
}
