import 'package:flutter/foundation.dart';
import 'package:hash_heartstring/Model/DatePlannerModel/DatePlannerModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatePlannerController {
  //Reference To The Hive Box
  static const datePlannerBox = 'datePlannerBox';
  final Box<DatePlannerModel> box = Hive.box<DatePlannerModel>(datePlannerBox);

  //Method To Create Date Activity
  Future<void> createDateActivity({required DatePlannerModel datePlannerModel}) async {
    await box.put(datePlannerModel.id, datePlannerModel);
  }

  //Method To Get Date Activity
  Future<DatePlannerModel?> getDateActivity({required String id}) async {
    return box.get(id);
  }

  //Method To Update DateActivity
  Future<void> updateDateActivity({required DatePlannerModel datePlannerModel}) async {
    await datePlannerModel.save();
  }

  //Method To Delete DateActivity
  Future<void> deleteDateActivity({required DatePlannerModel datePlannerModel}) async {
    await datePlannerModel.delete();
  }

  //Method To Update UI When There Is Changes
  ValueListenable<Box<DatePlannerModel>> listenToActivity() {
    return Hive.box<DatePlannerModel>(datePlannerBox).listenable();
  }
}