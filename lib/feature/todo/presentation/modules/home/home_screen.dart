import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_cubit.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_state.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/widgets/dialog/add_todo_dialog.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/widgets/dialog/edit_todo_dialog.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/widgets/swith_active_only.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/widgets/todo_list.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/widgets/todo_list_shimmer.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/snackbar/custom_snackbar.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NormalText(
          text: 'Todo List',
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorConstants.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoDialog(context, onAdd: (title) async {
            await context
                .read<TodoCubit>()
                .insertTodo(
                  title: title,
                )
                .then((value) {
              context.read<TodoCubit>().getTodoList();
              Navigator.pop(context);
              showCustomSnackbar(
                context: context,
                text: 'Todo added successfully',
                color: ColorConstants.green,
              );
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            if (state is TodoLoaded) {
              return Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.read<TodoCubit>().todoActiveCount > 0 ? const SwithActiveOnly() : const SizedBox(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalText(text: 'Total Active : ${context.read<TodoCubit>().todoActiveCount}', fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorConstants.outline),
                          NormalText(text: 'Total Complete : ${context.read<TodoCubit>().todoCompleteCount}', fontSize: 12.sp, fontWeight: FontWeight.w400, color: ColorConstants.outline),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                        child: TodoList(
                          todoList: state.todoList,
                          onClickItem: (todo) async {
                            await context.read<TodoCubit>().updateTodo(todo: todo).then((value) async {
                              showCustomSnackbar(
                                context: context,
                                text: 'Todo ${todo.title} updated successfully',
                                color: ColorConstants.green,
                              );
                              await context.read<TodoCubit>().getTodoList();
                            });
                          },
                          onDismissedItem: (index) async {
                            await context.read<TodoCubit>().deleteTodo(index: index).then((value) async {
                              await context.read<TodoCubit>().getTodoList();
                              showCustomSnackbar(
                                context: context,
                                text: 'Todo deleted successfully',
                                color: ColorConstants.green,
                              );
                            });
                          },
                          onEditItem: (index) async {
                            showEditTodoDialog(context, state.todoList![index], onUpdate: (title) async {
                              await context
                                  .read<TodoCubit>()
                                  .updateTodo(
                                    todo: state.todoList![index].copyWith(title: title),
                                  )
                                  .then((value) {
                                context.read<TodoCubit>().getTodoList();
                                Navigator.pop(context);
                                showCustomSnackbar(
                                  context: context,
                                  text: 'Todo updated successfully',
                                  color: ColorConstants.green,
                                );
                              });
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is TodoLoadFailed) {
              return Center(
                child: NormalText(
                  text: 'Something went wrong',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.primary,
                ),
              );
            } else if (state is TodoEmpty) {
              return Center(
                child: NormalText(
                  text: 'Todo is Empty',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.primary,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                        child: const TodoListShimmer(),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
