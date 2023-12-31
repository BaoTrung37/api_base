import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LetInYouScreen extends StatelessWidget {
  const LetInYouScreen({super.key});

  void onGoToSignInWithPassword(BuildContext context) {
    context.pushRoute(const SignInRoute());
  }

  void onGoToSignUpScreen(BuildContext context) {
    context.pushRoute(const SignUpRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return IgnoreUserInteractionWhenLoadingView(
            status: state.loginStatus,
            child: Scaffold(
              appBar: const BaseAppBar.titleOnly(
                title: '',
                shouldShowBottomDivider: false,
              ),
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  child: _buildMainContent(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildLogo(context),
            16.verticalSpace,
            _buildTitle(context),
            24.verticalSpace,
            AppButton(
              isExpanded: true,
              title: 'Sign in with password',
              onTap: () => onGoToSignInWithPassword(context),
            ),
            16.verticalSpace,
            AppButton(
              isExpanded: true,
              title: 'Login by access token',
              backgroundColor: context.colors.secondaryBackgroundSecondary,
              onTap: () async {
                await getIt.get<LoginCubit>().loginByAccessToken();
              },
            ),
            16.verticalSpace,
            AppButton(
              isExpanded: true,
              title: 'Login as guest',
              backgroundColor: context.colors.backgroundContrast,
              onTap: () {
                //
              },
            ),
            // 16.verticalSpace,
            // _buildLoginButton(
            //   context,
            //   icon: Assets.icons.icApple,
            //   title: 'Continue with Apple',
            //   onTap: () {
            //   },
            // ),
            _buildOrDivider(context),
            _buildLoginButton(
              context,
              icon: Assets.icons.icFacebook,
              title: 'Continue with Facebook',
              onTap: () {
                //
              },
            ),
            16.verticalSpace,
            _buildLoginButton(
              context,
              icon: Assets.icons.icGoogle,
              title: 'Continue with Google',
              onTap: () {
                //
              },
            ),
            16.verticalSpace,
            _buildSignUp(context),
          ],
        );
      },
    );
  }

  Widget _buildSignUp(BuildContext context) {
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
          onTap: () => onGoToSignUpScreen(context),
          title: 'Sign up',
        ),
      ],
    );
  }

  Widget _buildOrDivider(BuildContext context) {
    return AppVerticalDivider(
      child: Text(
        'or',
        style: AppTextStyles.textMedium.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Let's you In",
      style: AppTextStyles.headingLarge.copyWith(
        color: context.colors.textPrimary,
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return const AppLogo();
  }

  Widget _buildLoginButton(
    BuildContext context, {
    required SvgGenImage icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colors.border,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.svg(height: 30.h),
            8.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.textLargeBold.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
