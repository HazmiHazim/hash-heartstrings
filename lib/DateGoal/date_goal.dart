import 'package:flutter/material.dart';
import 'package:hash_heartstring/DateGoal/date_activity_dialog_box.dart';

import 'date_list.dart';

class date_goal extends StatefulWidget {
  const date_goal({super.key});

  @override
  State<date_goal> createState() => _date_goalState();
}

class _date_goalState extends State<date_goal> {

  //Date List To Do
  List dateToDO = [
    ["Start Date", false],
    ["Kiss Him", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(
        title: Text('Date To Do'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dateToDO.length,
        itemBuilder: (context, index) {
          return dateList(
              dateActivityName: dateToDO[index][0],
              dateActivityCompleted: dateToDO[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: createNewActivityDate, //disable click add
        child: Icon(Icons.add),
      ),
    );
  }

  //click checkbox
  void checkBoxChanged(bool? value, int index) {
    setState((){
      dateToDO[index][1] = !dateToDO[index][1];
    });
  }

  void createNewActivityDate() {
    showDialog(context: context, builder: (context)
      {
        return dateActivityDialogBox();
      },
    );
  }

}
