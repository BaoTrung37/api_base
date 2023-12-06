// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:api_base/presentation/resources/resources.dart';

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: context.colors.action,
          ),
        ),
        if (child != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: child,
          ),
        Expanded(
          child: Container(
            height: 1,
            color: context.colors.action,
          ),
        ),
      ],
    );
  }
}
