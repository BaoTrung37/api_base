import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        title: Text(
          'Movie Detail',
          style: AppTextStyles.headingSmall
              .copyWith(color: context.colors.textPrimary),
        ),
        isCenterTitle: false,
        widgets: [
          Assets.icons.icFavoriteOutline.svg(height: 24.h),
          16.horizontalSpace,
          Assets.icons.icStarOutline.svg(height: 24.h),
          16.horizontalSpace,
          Assets.icons.icBookmarkOutline.svg(height: 24.h),
        ],
      ),
      body: const Text(''),
    );
  }
}
