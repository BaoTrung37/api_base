import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onGoToSignInWithPassword(BuildContext context) {
    context.pushRoute(const SignInRoute());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppUtilities.unFocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const BaseAppBar(
          shouldShowBottomDivider: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLogo(context),
                24.verticalSpace,
                _buildHeadingTitle(),
                24.verticalSpace,
                InputTextField.singleLine(
                  placeholder: 'Email',
                  prefixIcon: const Icon(
                    Icons.mail,
                  ),
                  enableSuggestions: false,
                  autoCorrect: false,
                  textInputAction: TextInputAction.next,
                  onSubmit: (_) => FocusScope.of(context).nextFocus(),
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
                24.verticalSpace,
                AppButton(
                  isExpanded: true,
                  onTap: () {
                    // TODO: Implement sign up method
                  },
                  title: 'Sign up',
                ),
                24.verticalSpace,
                const AppVerticalDivider(
                  child: Text(
                    'or continue with',
                  ),
                ),
                24.verticalSpace,
                _buildSignUpOptions(context),
                16.verticalSpace,
                _buildSignIn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppTextStyles.labelMediumLight
              .copyWith(color: context.colors.textSecondary),
        ),
        4.horizontalSpace,
        AppTextButton(
          onTap: () => onGoToSignInWithPassword(context),
          title: 'Sign In',
        ),
      ],
    );
  }

  Widget _buildSignUpOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBorderButton(
          context,
          iconSvg: Assets.icons.icFacebook,
          onTap: () {
            // TODO: Implement
          },
        ),
        16.horizontalSpace,
        _buildBorderButton(
          context,
          iconSvg: Assets.icons.icGoogle,
          onTap: () {
            //
          },
        ),
        16.horizontalSpace,
        _buildBorderButton(
          context,
          iconSvg: Assets.icons.icApple,
          onTap: () {
            //
          },
        ),
      ],
    );
  }

  Widget _buildBorderButton(
    BuildContext context, {
    required SvgGenImage iconSvg,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colors.border,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: iconSvg.svg(height: 24.h),
    );
  }

  Widget _buildHeadingTitle() {
    return const Text(
      'Create your account',
      style: AppTextStyles.headingLarge,
    );
  }

  Widget _buildLogo(BuildContext context) {
    return const AppLogo();
  }
}
