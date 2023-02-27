import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'DateActivityModel.g.dart';

@HiveType(typeId: 0)
class DateActivityModel extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  String dateDescription;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  bool isComplete;

  DateActivityModel({
    required this.id,
    required this.dateDescription,
    required this.createdAt,
    required this.isComplete,
  });

  factory DateActivityModel.create({required String dateDescription, required DateTime createdAt}) =>
      DateActivityModel(
          id: Uuid().v4(),
          dateDescription: dateDescription,
          createdAt: DateTime.now(),
          isComplete: false
      );
}