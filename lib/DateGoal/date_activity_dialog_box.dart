import 'package:flutter/material.dart';

class dateActivityDialogBox extends StatelessWidget {
  const dateActivityDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: Container(
        height: 130,
        child: Column(children: [
          //Get Input from User
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
            ),
          ),

          //Save Button & Cancel Button
          Row(
            children: [

            ],
          )
        ],),
      ),
    );
  }
}
