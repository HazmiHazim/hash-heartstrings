import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/DateGoal/date_activity_dialog_box.dart';
import 'package:hash_heartstring/DateGoal/date_goal_database.dart';
import 'package:hash_heartstring/SideBarMenu/main_side_bar.dart';
import 'package:hive/hive.dart';
import 'date_list.dart';

class date_goal extends StatefulWidget {
  const date_goal({super.key});

  @override
  State<date_goal> createState() => _date_goalState();
}

class _date_goalState extends State<date_goal> {


  //Reference the hive box
  final dateActivity = Hive.box('DateToDo');

  //Call date_goal_database
  DateGoalDatabase DateDB = DateGoalDatabase();

  //click checkbox
  void checkBoxChanged(bool? value, int index) {
    setState((){
      DateDB.dateToDO[index][1] = !DateDB.dateToDO[index][1];
    });
  }

  void createNewActivityDate() {
    showDialog(context: context, builder: (context)
      {
        return dateActivityDialogBox();
      },
    );
  }

  //Display data when data is empty
  displayEmptyImage () {
    if (dateActivity == null) {
      return Icon(EvaIcons.heart);
    }
    else {
      DateDB.ReadDateActivity();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFF8B1C3),
      appBar: AppBar(title: Text('Date To Do'), centerTitle: true,),
      drawer: mainSideBar(),
      body: ListView.builder(itemCount: DateDB.dateToDO.length, itemBuilder: (context, index) {
        final activity = DateDB.dateToDO[index];
          return dateList(
              dateActivityName: activity['DateDescription'],
              dateActivityCompleted: activity['DateType'],
              onChanged: (value) => (){}//checkBoxChanged(value, index),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.pink, onPressed: createNewActivityDate, child: const Icon(Icons.add),
      ),
    );
  }


}
