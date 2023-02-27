import 'package:hive_flutter/hive_flutter.dart';

class DateGoalDatabase {

  //Create Table in Hive Database
  List dateToDO = [];

  //Reference the box
  final dateActivity = Hive.box('DateToDo');

  //Read Data from Hive Database
  void ReadDateActivity() {
    dateToDO = dateActivity.get("DateType");
    dateToDO = dateActivity.get("DateDescription");
  }

  //Update Data from Hive Database
  void UpdateDateActivity() {
    dateActivity.put("DateType", dateToDO);
  }
}

