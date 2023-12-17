// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.title,
    required this.onTap,
    super.key,
    this.isExpanded = false,
  });

  final bool isExpanded;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Ink(
        decoration: BoxDecoration(
          color: context.colors.primaryMain,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: isExpanded
              ? Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: _buttonChild(context),
                )
              : _buttonChild(context),
        ),
      ),
    );
  }

  Widget _buttonChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.labelMedium.copyWith(
            color: context.colors.textContrastOnDark,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
