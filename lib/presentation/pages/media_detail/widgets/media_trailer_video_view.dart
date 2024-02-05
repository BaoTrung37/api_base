import 'package:api_base/presentation/pages/media_detail/cubit/media_detail_cubit.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaTrailerVideoView extends StatelessWidget {
  const MediaTrailerVideoView({
    required this.mediaDetailCubit,
    super.key,
  });

  final MediaDetailCubit mediaDetailCubit;

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
