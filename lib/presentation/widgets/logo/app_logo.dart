import 'package:api_base/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: Assets.images.appLogo.image(
        height: 200.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
