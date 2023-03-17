import 'package:flutter/foundation.dart';
import 'package:hash_heartstring/Model/DatePlannerModel/DatePlannerModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DateActivityController {
  //Reference To The Hive Box
  static const DateActivityBoxName = 'DateActivity';
  final Box<DateActivityModel> box = Hive.box<DateActivityModel>(DateActivityBoxName);

  //Method To Create DateActivity
  Future<void> createDateActivity({required DateActivityModel dateActivityModel}) async {
    await box.put(dateActivityModel.id, dateActivityModel);
  }

  //Method To Get DateActivity
  Future<DateActivityModel?> getDateActivity({required String id}) async {
    return box.get(id);
  }

  //Method To Update DateActivity
  Future<void> updateDateActivity({required DateActivityModel dateActivityModel}) async {
    await dateActivityModel.save();
  }

  //Method To Delete DateActivity
  Future<void> deleteDateActivity({required DateActivityModel dateActivityModel}) async {
    await dateActivityModel.delete();
  }

  //Method To Update UI When There Is Changes
  ValueListenable<Box<DateActivityModel>> listenToDateActivity() {
    return Hive.box<DateActivityModel>(DateActivityBoxName).listenable();
  }
}