// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.title,
    required this.onTap,
    super.key,
    this.style,
  });

  final String title;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: style ??
            AppTextStyles.labelMedium
                .copyWith(color: context.colors.contentSpecialText),
      ),
    );
  }
}
