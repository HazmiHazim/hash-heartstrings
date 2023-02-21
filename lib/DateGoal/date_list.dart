import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class dateList extends StatelessWidget {

  final String dateActivityName;
  final bool dateActivityCompleted;
  Function(bool?)? onChanged;

  dateList({
    super.key,
    required this.dateActivityName,
    required this.dateActivityCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [

            //CheckBox
            Checkbox(
              value: dateActivityCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),

            //Task Name
            Text(
              dateActivityName,
              style: TextStyle(
                decoration: dateActivityCompleted ?
                TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
