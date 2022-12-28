import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_cubit.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/home_screen.dart';
import 'package:amartha_todo/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di<TodoCubit>()..getTodoList(),
      child: const HomeScreen(),
    );
  }
}
