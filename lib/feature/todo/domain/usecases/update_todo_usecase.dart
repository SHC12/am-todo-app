import 'package:amartha_todo/core/abstracts/usecase.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';

class UpdateTodoUseCase implements UseCase<TodoEntities, void> {
  final TodoRepository repository;

  UpdateTodoUseCase({required this.repository});

  @override
  Future<void> invoke(TodoEntities params) async {
    return await repository.updateTodo(params);
  }
}
