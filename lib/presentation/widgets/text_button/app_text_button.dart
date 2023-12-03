// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:api_base/presentation/resources/resources.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.style,
  });

  final String title;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
