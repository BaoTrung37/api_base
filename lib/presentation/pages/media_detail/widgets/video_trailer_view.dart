import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoTrailerView extends StatelessWidget {
  const VideoTrailerView({
    required this.movieDetailCubit,
    super.key,
  });

  final MovieDetailCubit movieDetailCubit;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Videos',
              style: AppTextStyles.headingSmall,
            ),
            16.verticalSpace,
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCachedNetworkImage(
                        height: 80.r,
                        width: 150.r,
                        imageUrl: AppConstant.posterUrl,
                        isBorder: true,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => 16.horizontalSpace,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
