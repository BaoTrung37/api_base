import 'package:api_base/presentation/resources/app_text_styles.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleHorizontalListView extends StatelessWidget {
  const PeopleHorizontalListView({super.key});

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
              height: 150.h,
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
        const Text(
          'Cast & Crew',
          style: AppTextStyles.headingSmall,
        ),
        SeeAllButton(
          onTap: () {
            //
          },
        ),
      ],
    );
  }
}
