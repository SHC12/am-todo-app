import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_cubit.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/cubit/todo_state.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwithActiveOnly extends StatefulWidget {
  const SwithActiveOnly({super.key});

  @override
  State<SwithActiveOnly> createState() => _SwithActiveOnlyState();
}

class _SwithActiveOnlyState extends State<SwithActiveOnly> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
      return SwitchListTile(
        value: context.read<TodoCubit>().activeOnly,
        activeColor: ColorConstants.primary,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (val) {
          context.read<TodoCubit>().showActiveOnly();
        },
        contentPadding: EdgeInsets.zero,
        title: NormalText(text: 'Active Only', fontSize: 14.sp, fontWeight: FontWeight.w400, color: ColorConstants.primary),
      );
    });
  }
}
