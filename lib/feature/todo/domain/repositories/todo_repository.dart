import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';

abstract class TodoRepository {
  Future<List<TodoEntities>?> getTodoList();

  Future<void> insertTodo(String title);

  Future<void> updateTodo(TodoEntities todo);

  Future<void> deleteTodo(int index);
}
