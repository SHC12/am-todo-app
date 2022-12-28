import 'dart:async';
import 'package:amartha_todo/feature/todo/data/datasources/local/local_data_source.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalDataSource localDataSource;

  TodoRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<void> deleteTodo(int index) async {
    try {
      await localDataSource.deleteTodoList(index);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoEntities>?> getTodoList() async {
    try {
      final List<TodoEntities>? todoList = await localDataSource.getTodoList();
      todoList?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      return todoList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> insertTodo(String title) async {
    try {
      final List<TodoEntities>? todoList = await localDataSource.getTodoList();
      int? lastId = 0;
      if (todoList != null && todoList.isNotEmpty) {
        lastId = todoList.last.id;
      }
      final int todoId = (lastId ?? 0) + 1;
      final TodoEntities todo = TodoEntities(id: todoId, title: title, createdAt: DateTime.now(), isComplete: false);
      await localDataSource.insertTodoList(todo);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(TodoEntities todo) async {
    try {
      await localDataSource.updateTodoList(todo);
    } catch (e) {
      rethrow;
    }
  }

  //#endregion

}
