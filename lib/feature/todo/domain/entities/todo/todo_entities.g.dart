// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoEntitiesAdapter extends TypeAdapter<TodoEntities> {
  @override
  final int typeId = 1;

  @override
  TodoEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoEntities(
      id: fields[0] as int?,
      title: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      completeAt: fields[3] as DateTime?,
      isComplete: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoEntities obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.completeAt)
      ..writeByte(4)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
