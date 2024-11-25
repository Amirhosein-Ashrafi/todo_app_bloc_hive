// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel()
      ..name = fields[0] as String
      ..isCompleted = fields[1] as bool
      ..priority = fields[2] as Prioritys;
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isCompleted)
      ..writeByte(2)
      ..write(obj.priority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriorityAdapter extends TypeAdapter<Prioritys> {
  @override
  final int typeId = 1;

  @override
  Prioritys read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Prioritys.low;
      case 1:
        return Prioritys.normal;
      case 2:
        return Prioritys.high;
      default:
        return Prioritys.low;
    }
  }

  @override
  void write(BinaryWriter writer, Prioritys obj) {
    switch (obj) {
      case Prioritys.low:
        writer.writeByte(0);
        break;
      case Prioritys.normal:
        writer.writeByte(1);
        break;
      case Prioritys.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
