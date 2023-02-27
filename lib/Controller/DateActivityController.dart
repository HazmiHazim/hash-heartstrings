import 'package:flutter/foundation.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DateActivityController {
  static const dateActivityBoxName = 'DateActivity';
  final Box<DateActivityModel> box = Hive.box<DateActivityModel>(dateActivityBoxName);
  
  //Method For Create Date Activity
  Future<void> createDateActivity({required DateActivityModel DateActivityDB}) async {
    await box.put(DateActivityDB.id, DateActivityDB);
  }

  //Method For Read Date Activity
  Future<void> getDateActivity({required String id}) async {
    await box.get(id);
  }

  //Method For Update Date Activity
  Future<void> updateDateActivity({required DateActivityModel DateActivityDB}) async {
    await DateActivityDB.save();
  }

  //Method For Delete Date Activity
  Future<void> deleteDateActivity({required DateActivityModel DateActivityDB}) async {
    await DateActivityDB.delete();
  }

  //Method For Update UI if There is Changes
  ValueListenable<Box<DateActivityModel>> listenToDateActivities() {
    return Hive.box<DateActivityModel>(dateActivityBoxName).listenable();
  }
}