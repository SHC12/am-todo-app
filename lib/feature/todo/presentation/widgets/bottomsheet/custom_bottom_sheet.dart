import 'package:flutter/material.dart';

showCustomBottomSheet(
  BuildContext context, {
  Widget? child,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4.0),
        topRight: Radius.circular(4.0),
      ),
    ),
    builder: (BuildContext context) {
      return AnimatedPadding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: SingleChildScrollView(
          child: child,
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(16),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             title,
          //             style: const TextStyle(
          //               color: ColorConstants.black,
          //               fontSize: 18,
          //               fontWeight: FontWeight.w700,
          //             ),
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //             child: const Icon(
          //               Icons.close,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     const Divider(
          //       height: 1,
          //       thickness: 1,
          //       color: ColorConstants.divider,
          //     ),
          //     Container(
          //       padding: EdgeInsets.all(16.r),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(4.r),
          //       ),
          //       child:
          //     ),
          //   ],
          // ),
        ),
      );
    },
  );
}
