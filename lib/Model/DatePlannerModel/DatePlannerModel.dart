import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'DatePlannerModel.g.dart';

@HiveType(typeId: 0)
class DatePlannerModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String activityName;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  bool isCompleted;

  DatePlannerModel({
    required this.id,
    required this.activityName,
    required this.createdAt,
    required this.isCompleted,
  });

  factory DatePlannerModel.create({required String activityName, DateTime? createdAt}) =>
      DatePlannerModel(id: Uuid().v4(),
          activityName: activityName,
          createdAt: createdAt ?? DateTime.now(),
          isCompleted: false);
}