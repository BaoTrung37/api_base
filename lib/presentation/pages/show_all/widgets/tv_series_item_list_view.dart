// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesItemListView extends StatelessWidget {
  const TvSeriesItemListView({
    required this.tvSeries,
    required this.onTvSeriesTap,
    super.key,
  });

  final MediaResponse tvSeries;
  final VoidCallback onTvSeriesTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTvSeriesTap,
      child: SizedBox(
        height: 120.h,
        width: 80.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomCachedNetworkImage(
                  height: 120.h,
                  width: 80.w,
                  imageUrl: tvSeries.posterPath.tmdbW300Path,
                  imageType: ImageType.media,
                  isBorder: true,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: context.colors.primaryMain,
                    ),
                    child: Text(
                      tvSeries.voteAverage!.toStringAsFixed(1),
                      style: AppTextStyles.labelXSmall,
                    ),
                  ),
                )
              ],
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tvSeries.name!,
                        style: AppTextStyles.textLargeBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        tvSeries.genresName,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  // Text(
                  //   tvSeries.releaseDate!,
                  //   style: AppTextStyles.labelSmallLight,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
