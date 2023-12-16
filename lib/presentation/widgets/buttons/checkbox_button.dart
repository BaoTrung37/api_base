// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxButton extends StatefulWidget {
  const CheckboxButton({
    required this.onValueChanged,
    super.key,
  });

  final ValueChanged<bool> onValueChanged;
  @override
  State<CheckboxButton> createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  final ValueNotifier<bool> onChange = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _checkboxView(context),
        8.horizontalSpace,
        const Text(
          'Remember me',
          style: AppTextStyles.labelMedium,
        ),
      ],
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
          side: BorderSide(
            color: context.colors.primaryMain,
            width: 3.w,
          ),
          value: onChange.value,
          onChanged: (value) {
            setState(() {
              onChange.value = value!;
              widget.onValueChanged.call(onChange.value);
            });
          },
        ),
      ),
    );
  }
}
