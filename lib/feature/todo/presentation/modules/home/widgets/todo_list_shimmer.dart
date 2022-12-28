import 'package:amartha_todo/feature/todo/presentation/widgets/shimmer/custom_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoListShimmer extends StatefulWidget {
  const TodoListShimmer({
    super.key,
  });

  @override
  State<TodoListShimmer> createState() => _TodoListShimmerState();
}

class _TodoListShimmerState extends State<TodoListShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: CustomShimmer(
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  flex: 3,
                  child: CustomShimmer(
                    width: 100.w,
                    height: 20.h,
                    radius: 8.r,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
