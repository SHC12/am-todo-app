import 'package:amartha_todo/core/abstracts/usecase.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/get_todo_list_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/update_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodoListUseCase getTodoListUseCase;
  final InsertTodoUseCase insertTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  String companyName = '-';
  TodoCubit({
    required this.getTodoListUseCase,
    required this.insertTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
  }) : super(TodoInit());

  bool activeOnly = false;

  List<TodoEntities>? _todoList;

  List<TodoEntities>? get todoList => _todoList;

  int get todoActiveCount {
    int count = 0;
    if (_todoList != null) {
      for (final TodoEntities todo in _todoList!) {
        if (todo.isComplete == false) {
          count++;
        }
      }
    }
    return count;
  }

  int get todoCompleteCount {
    int count = 0;
    if (_todoList != null) {
      for (final TodoEntities todo in _todoList!) {
        if (todo.isComplete == true) {
          count++;
        }
      }
    }
    return count;
  }

  Future getTodoList() async {
    emit(const TodoLoading());
    try {
      final List<TodoEntities>? todoList = await getTodoListUseCase.invoke(NoParams());
      if ((todoList ?? []).isNotEmpty) {
        _todoList = todoList;
        if (_todoList?.every((element) => element.isComplete == true) ?? false) {
          activeOnly = false;
        }
        emit(
          TodoLoaded(
            todoList: todoList,
          ),
        );
      } else {
        emit(const TodoEmpty());
      }
    } catch (e) {
      emit(TodoLoadFailed(message: e.toString()));
    }
  }

  Future insertTodo({String? title}) async {
    try {
      await insertTodoUseCase.invoke(title!);
    } catch (e) {
      emit(TodoLoadFailed(message: e.toString()));
    }
  }

  Future updateTodo({TodoEntities? todo}) async {
    try {
      await updateTodoUseCase.invoke(todo!);
    } catch (e) {
      emit(TodoLoadFailed(message: e.toString()));
    }
  }

  Future deleteTodo({int? index}) async {
    try {
      await deleteTodoUseCase.invoke(index ?? 0);
    } catch (e) {
      emit(TodoLoadFailed(message: e.toString()));
    }
  }

  void showActiveOnly() async {
    try {
      emit(const TodoLoading());
      activeOnly = !activeOnly;
      List<TodoEntities> filterList = [];
      if (activeOnly) {
        filterList = _todoList!.where((element) => element.isComplete == false).toList();
      } else {
        filterList = _todoList ?? [];
      }

      emit(
        TodoLoaded(
          todoList: filterList,
        ),
      );
    } catch (e) {
      emit(TodoLoadFailed(message: e.toString()));
    }
  }
}
