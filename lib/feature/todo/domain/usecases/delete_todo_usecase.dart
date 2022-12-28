import 'package:amartha_todo/core/abstracts/usecase.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<int, void> {
  final TodoRepository repository;

  DeleteTodoUseCase({required this.repository});

  @override
  Future<void> invoke(int params) async {
    return await repository.deleteTodo(params);
  }
}
