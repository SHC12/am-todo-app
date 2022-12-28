import 'package:amartha_todo/feature/todo/data/datasources/local/local_data_source.dart';
import 'package:amartha_todo/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:amartha_todo/feature/todo/data/services/local/hive_service.dart';
import 'package:amartha_todo/feature/todo/domain/repositories/todo_repository.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/get_todo_list_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/insert_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/domain/usecases/update_todo_usecase.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> init() async {
  // #region BLoCs

  di.registerFactory(
    () => TodoCubit(
      getTodoListUseCase: di(),
      insertTodoUseCase: di(),
      updateTodoUseCase: di(),
      deleteTodoUseCase: di(),
    ),
  );

  // #endregion

  // #region USE CASES

  di.registerLazySingleton(
    () => GetTodoListUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => InsertTodoUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => UpdateTodoUseCase(
      repository: di(),
    ),
  );

  di.registerLazySingleton(
    () => DeleteTodoUseCase(
      repository: di(),
    ),
  );

  // #endregion

  // #region REPOSITORIES

  di.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: di(),
    ),
  );

  // #endregion

  // #region DATA SOURCES

  di.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(
      hive: di(),
    ),
  );

  // #endregion

  // #region SERVICES

  di.registerLazySingleton<HiveService>(
    HiveService.new,
  );

  // #endregion
}
