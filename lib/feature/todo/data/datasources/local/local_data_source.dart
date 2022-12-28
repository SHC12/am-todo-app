import 'package:amartha_todo/feature/todo/data/services/local/hive_service.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';

class LocalDataSource {
  final HiveService hive;

  const LocalDataSource({required this.hive});

  Future<List<TodoEntities>?> getTodoList() async {
    final List<TodoEntities> results = await hive.getTodoList();
    return results;
  }

  Future<void> insertTodoList(TodoEntities todo) async {
    await hive.insertTodo([todo]);

    return;
  }

  Future<void> updateTodoList(TodoEntities todo) async {
    final List<TodoEntities> todoList = await hive.getTodoList();
    final int index = todoList.indexWhere((TodoEntities element) => element.id == todo.id);
    await hive.updateTodoAt(index, todo);
    return;
  }

  Future<void> deleteTodoList(int index) async {
    await hive.deleteTodo(index);
    return;
  }

//#endregion

}
