import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void onGoToSignUpScreen(BuildContext context) {
    context.replaceRoute(const SignUpRoute());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc()..add(const SignInEvent.started()),
      child: GestureDetector(
        onTap: () {
          AppUtilities.unFocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const BaseAppBar(
            shouldShowBottomDivider: false,
          ),
          body: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLogo(context),
                      24.verticalSpace,
                      _buildHeadingTitle(),
                      24.verticalSpace,
                      InputTextField.singleLine(
                        placeholder: 'Email',
                        initialText: state.email,
                        prefixIcon: const Icon(
                          Icons.mail,
                        ),
                        enableSuggestions: false,
                        autoCorrect: false,
                        textInputAction: TextInputAction.next,
                        validator: Validator().required().build(),
                        onSubmit: (_) => FocusScope.of(context).nextFocus(),
                        onTextChange: (value) {
                          context.read<SignInBloc>().add(
                                SignInEvent.emailChanged(value!),
                              );
                        },
                      ),
                      24.verticalSpace,
                      InputTextField.singleLine(
                        placeholder: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                        ),
                        validator: Validator().required().build(),
                        enableSuggestions: false,
                        autoCorrect: false,
                        isPassword: true,
                        onTextChange: (value) {
                          context.read<SignInBloc>().add(
                                SignInEvent.passwordChanged(value!),
                              );
                        },
                      ),
                      16.verticalSpace,
                      CheckboxButton(
                        onValueChanged: (value) {
                          print(value);
                          context
                              .read<SignInBloc>()
                              .add(SignInEvent.rememberMeChanged(value));
                        },
                      ),
                      16.verticalSpace,
                      AppButton(
                        isExpanded: true,
                        onTap: () {
                          context
                              .read<SignInBloc>()
                              .add(const SignInEvent.signInSubmitted());
                        },
                        title: 'Sign in',
                      ),
                      16.verticalSpace,
                      AppTextButton(
                        title: 'Forgot the password?',
                        onTap: () {
                          // TODO: Implement the forgot the password method?
                        },
                      ),
                      24.verticalSpace,
                      const AppVerticalDivider(
                        child: Text(
                          'or continue with',
                        ),
                      ),
                      24.verticalSpace,
                      _buildSignInOptions(context),
                      16.verticalSpace,
                      _buildSignUp(context),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
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

  Widget _buildSignInOptions(BuildContext context) {
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
      'Login to Your Account',
      style: AppTextStyles.headingLarge,
    );
  }

  Widget _buildLogo(BuildContext context) {
    return const AppLogo();
  }
}
