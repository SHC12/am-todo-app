import 'package:amartha_todo/core/constants/color_constants.dart';
import 'package:amartha_todo/core/extensions/string_extension.dart';
import 'package:amartha_todo/core/utils/styles.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/bottomsheet/custom_bottom_sheet.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/button/custom_button.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/snackbar/custom_snackbar.dart';
import 'package:amartha_todo/feature/todo/presentation/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAddTodoDialog(BuildContext context, {Function(String)? onAdd}) {
  TextEditingController titleController = TextEditingController();
  showCustomBottomSheet(
    context,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add a new todo item',
                style: TextStyle(
                  color: ColorConstants.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: ColorConstants.primary,
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: ColorConstants.divider,
        ),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(
                text: 'Title',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ColorConstants.black,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                controller: titleController,
                autofocus: false,
                style: FormStyle.normalTextStyle.copyWith(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: FormStyle.inputDecorationStyle.copyWith(
                  hintText: 'Go to hospital',
                  hintStyle: FormStyle.normalTextStyle.copyWith(fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: const BorderSide(color: ColorConstants.shadowCardColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    borderSide: const BorderSide(color: ColorConstants.outlineGrey),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomPrimaryButton(
                label: 'Add Todo',
                onPressed: () {
                  final String todoTitle = titleController.text;
                  if (todoTitle.isBlank()) {
                    showCustomSnackbar(context: context, text: 'Title must to fill', color: ColorConstants.red);
                  } else {
                    onAdd!(todoTitle);
                  }
                },
                type: ButtonType.large,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
