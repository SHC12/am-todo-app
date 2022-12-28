import 'package:amartha_todo/core/abstracts/usecase.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';

class InsertTodoUseCase implements UseCase<String, void> {
  final TodoRepository repository;

  InsertTodoUseCase({required this.repository});

  @override
  Future<void> invoke(String params) async {
    return await repository.insertTodo(params);
  }
}
