import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

const appBarHeight = 42.0;

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    this.title,
    this.buttonTintColor,
    this.onBackButtonTap,
    this.backgroundColor,
    this.widgets,
    this.shouldShowBottomDivider = true,
    this.shouldShowBackButton = true,
    this.textColor,
    this.navigationTitle,
    super.key,
  });

  const BaseAppBar.customTitleView({
    required this.title,
    this.onBackButtonTap,
    this.backgroundColor,
    this.buttonTintColor,
    this.widgets,
    this.shouldShowBottomDivider = true,
    this.textColor,
    super.key,
  })  : navigationTitle = null,
        shouldShowBackButton = true;

  const BaseAppBar.titleAndBackButton({
    required String title,
    this.onBackButtonTap,
    this.backgroundColor,
    this.textColor,
    this.buttonTintColor,
    this.shouldShowBottomDivider = true,
    this.widgets,
    super.key,
  })  : title = null,
        navigationTitle = title,
        shouldShowBackButton = true;

  const BaseAppBar.titleOnly({
    required String title,
    this.backgroundColor,
    this.textColor,
    this.shouldShowBottomDivider = true,
    this.widgets,
    super.key,
  })  : title = null,
        onBackButtonTap = null,
        navigationTitle = title,
        buttonTintColor = null,
        shouldShowBackButton = false;

  final Widget? title;
  final String? navigationTitle;

  final Color? textColor;
  final Color? buttonTintColor;
  final Color? backgroundColor;

  final List<Widget>? widgets;

  final bool shouldShowBottomDivider;
  final bool shouldShowBackButton;

  final VoidCallback? onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ??
          Text(
            navigationTitle ?? '',
            style: AppTextStyles.headingXSmall
                .copyWith(color: textColor ?? context.colors.textPrimary),
          ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? context.colors.backgroundPrimary,
      leading: shouldShowBackButton
          ? IconButton(
              onPressed: onBackButtonTap ??
                  () {
                    Navigator.of(context).pop();
                  },
              // icon: AppIcons.back(
              //   color: buttonTintColor ?? context.colors.textPrimary,
              // ),
              icon: Assets.icons.icBack.svg(),
            )
          : Container(),
      actions: widgets,
      bottom: shouldShowBottomDivider ? const AppBarDivider() : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

class AppBarDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppDivider();
  }

  @override
  Size get preferredSize => const Size.fromHeight(0.5);
}

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 0.5,
    this.thickness = 0.5,
  });

  final double thickness;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      color: Colors.grey,
    );
  }
}
