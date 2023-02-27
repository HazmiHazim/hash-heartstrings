// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DateActivityModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateActivityModelAdapter extends TypeAdapter<DateActivityModel> {
  @override
  final int typeId = 0;

  @override
  DateActivityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateActivityModel(
      id: fields[0] as String,
      dateType: fields[1] as String,
      dateDescription: fields[2] as String,
      createdAt: fields[3] as DateTime,
      isComplete: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DateActivityModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateType)
      ..writeByte(2)
      ..write(obj.dateDescription)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateActivityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
