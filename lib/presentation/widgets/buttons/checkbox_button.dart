import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxButton extends StatefulWidget {
  const CheckboxButton({super.key});

  @override
  State<CheckboxButton> createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  final ValueNotifier<bool> onChange = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _checkboxView(context),
          8.horizontalSpace,
          const Expanded(
            child: Text('Remember me'),
          ),
        ],
      ),
    );
  }

  Widget _checkboxView(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 20.w,
      child: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          activeColor: context.colors.primaryMain,
          side: BorderSide(color: context.colors.primaryMain, width: 3.w),
          value: onChange.value,
          onChanged: (value) {
            onChange.value = value!;
          },
        ),
      ),
    );
  }
}
