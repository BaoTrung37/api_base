import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingErrorView extends StatelessWidget {
  const LoadingErrorView({
    required this.onReload,
    super.key,
  });
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onReload,
         child: Assets.icons.icRetry.svg(
          height: 40.h,
          colorFilter: ColorFilter.mode(
            context.colors.iconPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
