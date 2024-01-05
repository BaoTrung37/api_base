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
                offset: Offset(8.w, -10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100.h,
                      width: 80.w,
                      color: Colors.green,
                    ),
                    8.horizontalSpace,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('The Family Plan'),
                        const Text('Rate'),
                        Container(
                          height: 100.h,
                          width: 80.w,
                          color: Colors.green,
                        ),
                      ],
                    )
                  ],
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
}
