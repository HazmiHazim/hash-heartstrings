import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'DateActivityModel.g.dart';

@HiveType(typeId: 0)
class DateActivityModel extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String dateType;
  @HiveField(2)
  final String dateDescription;
  @HiveField(3)
  final DateTime createdAt;
  @HiveField(4)
  final bool isComplete;

  DateActivityModel({
    required this.id,
    required this.dateType,
    required this.dateDescription,
    required this.createdAt,
    required this.isComplete,
  });

  factory DateActivityModel.create({required String dateType, required String dateDescription}) =>
      DateActivityModel(
          id: Uuid().v4(),
          dateType: dateType,
          dateDescription: dateDescription,
          createdAt: DateTime.now(),
          isComplete: false
      );
}