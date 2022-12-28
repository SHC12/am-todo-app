import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInit extends TodoState {}

class TodoLoading extends TodoState {
  const TodoLoading();

  @override
  List<Object?> get props => [];
}

class TodoLoaded extends TodoState {
  final List<TodoEntities>? todoList;
  const TodoLoaded({this.todoList});

  @override
  List<Object?> get props => [todoList];
}

class TodoEmpty extends TodoState {
  const TodoEmpty();

  @override
  List<Object?> get props => [];
}

class TodoLoadFailed extends TodoState {
  final String message;
  const TodoLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
