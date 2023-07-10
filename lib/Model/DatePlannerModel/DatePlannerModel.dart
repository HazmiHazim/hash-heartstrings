import 'package:cloud_firestore/cloud_firestore.dart';

class DatePlannerModel {
  final String id;
  String activityName;
  DateTime createdAt;
  bool isCompleted;

  DatePlannerModel ({
    required this.id,
    required this.activityName,
    required this.createdAt,
    required this.isCompleted
  });

  factory DatePlannerModel.fromSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return DatePlannerModel(
      id: snapshot.id,
      activityName: data['activityName'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      isCompleted: data['isCompleted'] ?? false,
    );
  }
}