// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:api_base/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TvDetailScreen extends StatefulWidget {
  const TvDetailScreen({
    required this.seriesId,
    super.key,
  });
  final int seriesId;

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        title: Text(
          'Tv Detail',
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
          16.horizontalSpace,
        ],
      ),
    );
  }
}
