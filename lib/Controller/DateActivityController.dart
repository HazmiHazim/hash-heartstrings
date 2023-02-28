import 'package:flutter/foundation.dart';
import 'package:hash_heartstring/Model/DateActivityModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class DateActivityController {

  late Box<DateActivityModel> dateActivityBox;

  //Reference DateActivity Hive Box
  DateActivityController() {
    dateActivityBox = Hive.box<DateActivityModel>('DateActivity');
  }

  //Method For Create Date Activity
  Future<void> createDateActivity(String dateDescription) async {
    final id = Uuid().v4();
    final createdAt = DateTime.now();
    final isComplete = false;
    final dateActivity = DateActivityModel(
        id: id,
        dateDescription: dateDescription,
        createdAt: createdAt,
        isComplete: isComplete);
    await dateActivityBox.add(dateActivity);
  }

  //Method For Read Date Activity
  List<DateActivityModel> getDateActivity() {
    final dateActivities =
    dateActivityBox.values.toList().cast<DateActivityModel>();
    return dateActivities;
  }

  //Method For Update Date Activity
  Future<void> updateDateActivity(String id, String dateDescription, bool isComplete) async {
    final dateActivity = dateActivityBox.values.firstWhere((e) => e.id == id);
    dateActivity.dateDescription = dateDescription;
    dateActivity.isComplete = isComplete;
    await dateActivity.save();
  }

  //Method For Delete Date Activity
  Future<void> deleteDateActivity(String id) async {
    final dateActivity = dateActivityBox.values.firstWhere((e) => e.id == id);
    await dateActivity.delete();
  }

  //Method For Update UI if There is Changes
  ValueListenable<Box<DateActivityModel>> listenToDateActivities() {
    return Hive.box<DateActivityModel>('DateActivity').listenable();
  }
}