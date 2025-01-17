// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/resources/app_text_styles.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleHorizontalListView extends StatelessWidget {
  const CircleHorizontalListView({
    required this.headingTitle,
    this.onAllTap,
    super.key,
  });

  final String headingTitle;
  final VoidCallback? onAllTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            _buildHeadingTitle(),
            16.verticalSpace,
            SizedBox(
              height: 160.h,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCachedNetworkImage(
                        height: 100.r,
                        width: 100.r,
                        imageUrl: AppConstant.posterUrl,
                        isCircleImage: true,
                      ),
                      const Spacer(),
                      const Text(
                        'Bao Trung',
                        style: AppTextStyles.textMediumBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        'Handsome',
                        style: AppTextStyles.textSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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

  Widget _buildHeadingTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingTitle,
          style: AppTextStyles.headingSmall,
        ),
        SeeAllButton(
          onTap: () {
            onAllTap?.call();
          },
        ),
      ],
    );
  }
}
