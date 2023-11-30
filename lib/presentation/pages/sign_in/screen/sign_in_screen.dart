import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleAndBackButton(title: 'Sign In'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: 200.w,
                color: context.colors.backdropPrimary,
              ),
              16.verticalSpace,
              Text(
                'Let\'s You In',
                style: AppTextStyles.headingLarge.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              16.verticalSpace,
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
