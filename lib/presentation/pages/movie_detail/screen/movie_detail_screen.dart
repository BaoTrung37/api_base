import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      body: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                color: Colors.red,
              ),
              Transform.translate(
                offset: Offset(0, -10.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.h,
                        width: 80.w,
                        color: Colors.green,
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'The Family Plan The Family Plan The Family Plan',
                              style: AppTextStyles.headingSmall,
                            ),
                            8.verticalSpace,
                            _buildMovieRate(),
                            16.verticalSpace,
                            Container(
                              height: 100.h,
                              width: 80.w,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: Colors.blue,
          ),
        )
      ],
    );
  }

  Widget _buildMovieRate() {
    return Row(
      children: [
        RatingBar(
          initialRating: 2.4,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: Assets.icons.icStar.svg(),
            half: Assets.icons.icStarHalf.svg(),
            empty: Assets.icons.icStarOutline.svg(),
          ),
          ignoreGestures: true,
          itemSize: 16.sp,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
          onRatingUpdate: (_) {},
        ),
        8.horizontalSpace,
        const Text(
          '(100)',
          style: AppTextStyles.textMediumBold,
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.icStar.svg(height: 16.sp),
                8.horizontalSpace,
                const Text(
                  '9.5',
                  style: AppTextStyles.textMediumBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
