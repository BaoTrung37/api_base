// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/resources/resources.dart';
import 'package:api_base/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    required this.headingTitle,
    this.showAllTap,
    this.height,
    this.width,
    super.key,
  });

  final String headingTitle;

  final double? height;
  final double? width;

  final VoidCallback? showAllTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                headingTitle,
                style: AppTextStyles.headingSmall,
              ),
              SeeAllButton(
                onTap: () => showAllTap,
              ),
            ],
          ),
          SizedBox(
            height: height ?? 220.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: height ?? 220.h,
                  width: width ?? 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        'Movie Title Movie Title',
                        style: AppTextStyles.labelLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        'Subtitle',
                        style: AppTextStyles.labelMediumLight,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
              separatorBuilder: (context, index) => 16.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }
}
