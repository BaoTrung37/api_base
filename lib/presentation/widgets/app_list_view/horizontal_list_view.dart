// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:api_base/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    required this.headingTitle,
    required this.movies,
    super.key,
    this.height,
    this.width,
    this.showAllTap,
  });

  final String headingTitle;
  final List<MovieResponse> movies;

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
            height: height ?? 250.h,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return SizedBox(
                  height: height ?? 250.h,
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
                      8.verticalSpace,
                      SizedBox(
                        height: 70.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              movie.title,
                              style: AppTextStyles.labelLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              'hahah',
                              style: AppTextStyles.labelMediumLight,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: movies.length,
              separatorBuilder: (context, index) => 16.horizontalSpace,
            ),
          ),
        ],
      ),
    );
  }
}
