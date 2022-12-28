import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:amartha_todo/core/extensions/string_extension.dart';
import 'package:amartha_todo/feature/todo/domain/entities/todo/todo_entities.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/button/custom_button.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoList extends StatefulWidget {
  final List<TodoEntities>? todoList;
  final Function(TodoEntities)? onClickItem;
  final Function(int)? onDismissedItem;
  final Function(int)? onEditItem;
  const TodoList({
    super.key,
    this.todoList,
    this.onClickItem,
    this.onDismissedItem,
    this.onEditItem,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList?.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: ColorConstants.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(12.r),
              child: NormalText(
                text: 'Delete',
                textAlign: TextAlign.start,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: ColorConstants.white,
              ),
            ),
            onDismissed: (direction) {
              widget.todoList?.removeAt(index);
              widget.onDismissedItem!(index);
            },
            child: InkWell(
              onTap: () {
                final TodoEntities? todo = widget.todoList?[index].copyWith(
                  isComplete: !(widget.todoList![index].isComplete ?? false),
                  completeAt: (widget.todoList![index].isComplete ?? false) ? null : DateTime.now(),
                );

                widget.onClickItem!(todo!);
              },
              child: Container(
                margin: EdgeInsets.all(4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12.r),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (widget.todoList?[index].isComplete ?? false) ? ColorConstants.outline : ColorConstants.primary,
                        ),
                        child: Center(
                          child: NormalText(
                            text: widget.todoList?[index].title?.getFirstWordOfTitle(countWord: 1),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorConstants.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        widget.todoList?[index].title ?? '',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: (widget.todoList?[index].isComplete ?? false) ? ColorConstants.outline : ColorConstants.black,
                          overflow: TextOverflow.clip,
                          decoration: (widget.todoList?[index].isComplete ?? false) ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                    ),
                    !(widget.todoList?[index].isComplete ?? false)
                        ? TextButton(
                            onPressed: () {
                              widget.onEditItem!(index);
                            },
                            child: NormalText(
                              text: 'Edit',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.darkBlue,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
