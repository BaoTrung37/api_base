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
      appBar: const BaseAppBar(
        shouldShowBottomDivider: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(context),
            24.verticalSpace,
            _buildHeadingTitle(),
            24.verticalSpace,
            const InputTextField.singleLine(
              placeholder: 'Email',
              prefixIcon: Icon(
                Icons.mail,
              ),
              enableSuggestions: false,
              autoCorrect: false,
            ),
            24.verticalSpace,
            const InputTextField.singleLine(
              placeholder: 'Password',
              prefixIcon: Icon(
                Icons.lock_rounded,
              ),
              enableSuggestions: false,
              autoCorrect: false,
              isPassword: true,
            ),
            16.verticalSpace,
            CheckboxButton(
              onValueChanged: (value) {
                print('$value');
              },
            ),
          ],
        ),
      ),
    );
  }

  Text _buildHeadingTitle() {
    return const Text(
      'Create your account',
      style: AppTextStyles.headingLarge,
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      color: context.colors.backdropPrimary,
    );
  }
}
