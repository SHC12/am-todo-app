import 'package:amartha_todo/core/abstracts/usecase.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';

class GetTodoListUseCase implements UseCase<NoParams, List<TodoEntities>?> {
  final TodoRepository repository;

  GetTodoListUseCase({required this.repository});

  @override
  Future<List<TodoEntities>?> invoke(NoParams params) async {
    return await repository.getTodoList();
  }
}
