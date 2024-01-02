// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:api_base/presentation/utilities/extensions/datetime_extension.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:api_base/presentation/widgets/buttons/buttons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieHorizontalListView extends StatelessWidget {
  const MovieHorizontalListView({
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
          16.verticalSpace,
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
                        child: CachedNetworkImage(
                          imageUrl: movie.posterPath.tmdbW154Path,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
                            Text(
                              movie.releaseDate.formatDateTime,
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
