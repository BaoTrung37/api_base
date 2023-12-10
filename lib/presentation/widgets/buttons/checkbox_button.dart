import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxButton extends StatelessWidget {
  const CheckboxButton({super.key});

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
    return Theme(
      data: Theme.of(context).copyWith(
          checkboxTheme: const CheckboxThemeData(
        side: BorderSide(color: Colors.red),
      )),
      child: SizedBox(
        height: 16.h,
        width: 16.h,
        child: Checkbox(
          value: true,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
