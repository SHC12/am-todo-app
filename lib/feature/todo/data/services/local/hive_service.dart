import 'package:amartha_todo/core/constants/hive_constants.dart';
import 'package:amartha_todo/core/services/base_hive_service.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends BaseHiveService {
  @override
  void registerAdapter() {
    Hive.registerAdapter(TodoEntitiesAdapter());
  }

  Future<List<TodoEntities>> getTodoList() async {
    final List<TodoEntities> results = await getAll<TodoEntities>(boxName: HiveConstants.boxTodo) as List<TodoEntities>;
    return results;
  }

  Future<void> insertTodo(List<TodoEntities> todos) async {
    await insertAll(boxName: HiveConstants.boxTodo, listData: todos);
  }

  Future<void> updateTodoAt(int index, TodoEntities todo) async {
    await updateAt<TodoEntities>(boxName: HiveConstants.boxTodo, index: index, data: todo);
  }

  Future<void> deleteTodo(int index) async {
    await deleteAt(boxName: HiveConstants.boxTodo, index: index);
  }
}
