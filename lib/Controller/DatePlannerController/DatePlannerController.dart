import 'package:cloud_firestore/cloud_firestore.dart';

class DatePlannerController {
  // Initialize Cloud Firestore
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Method To Create Date Activity
  Future<void> createDateActivity(String activityName, DateTime createdAt) async {
    await db.collection('dateActivity').add({
      'activityName': activityName,
      'createdAt': createdAt,
    });
  }

  // Method To Update DateActivity
  Future<void> updateDateActivity(String activityId, String activityName, bool isCompleted) async {
    await db.collection('dateActivity').doc(activityId).update({
      'activityName': activityName,
      'isCompleted' : isCompleted,
    });
  }

  // Method To Delete DateActivity
  Future<void> deleteDateActivity(String activityId) async {
    await db.collection('dateActivity').doc(activityId).delete();
  }
}