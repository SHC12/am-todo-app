import 'package:amartha_todo/core/constants/hive_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'todo_entities.g.dart';

@HiveType(typeId: HiveConstants.typeTodoEntities)
class TodoEntities extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final DateTime? createdAt;
  @HiveField(3)
  final DateTime? completeAt;
  @HiveField(4)
  final bool? isComplete;

  const TodoEntities({
    this.id,
    required this.title,
    this.createdAt,
    this.completeAt,
    this.isComplete,
  });

  TodoEntities copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? completeAt,
    bool? isComplete,
  }) {
    return TodoEntities(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      completeAt: completeAt ?? this.completeAt,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      createdAt,
      completeAt,
      isComplete,
    ];
  }
}
