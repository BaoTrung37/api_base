// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MediaFunction = Function(int mediaId);

class MediaHorizontalListView extends StatelessWidget {
  const MediaHorizontalListView({
    required this.headingTitle,
    required this.medias,
    required this.onMediaTap,
    super.key,
    this.height,
    this.width,
    this.padding,
    this.showAllTap,
    this.isPoster = true,
  });

  final String headingTitle;
  final List<MediaResponse> medias;

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? showAllTap;
  final MediaFunction onMediaTap;
  final bool isPoster;

  double _getWidthItem(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    if (isPoster) {
      return size * 0.3;
    }
    return size * 0.45;
  }

  double _getHeightItem() {
    return isPoster ? 230.h : 180.h;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: padding,
        child: Column(
          children: [
            if (medias.isNotEmpty) ...[
              _buildHeadingTitle(),
              16.verticalSpace,
              _buildMovieListView()
            ],
            // else
            //   LoadingListView(
            //     height: height ?? _getHeightItem(),
            //     width: width ?? _getWidthItem(context),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieListView() {
    return SizedBox(
      height: height ?? _getHeightItem(),
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final media = medias[index];
          return _buildMediaItem(context, media, onMediaTap);
        },
        itemCount: medias.length,
        separatorBuilder: (context, index) => 16.horizontalSpace,
      ),
    );
  }

  Widget _buildMediaItem(
    BuildContext context,
    MediaResponse media,
    MediaFunction onMediaTap,
  ) {
    return GestureDetector(
      onTap: () {
        onMediaTap.call(media.id);
      },
      child: SizedBox(
        height: height ?? _getHeightItem(),
        width: width ?? _getWidthItem(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomCachedNetworkImage(
                imageType: ImageType.movie,
                imageUrl: isPoster
                    ? media.posterPath?.tmdbW500Path
                    : media.backdropPath?.tmdbW500Path,
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    media.title ?? media.name ?? '',
                    style: AppTextStyles.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  Text(
                    media.genresName,
                    style: AppTextStyles.labelSmallLight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
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
          onTap: () => showAllTap?.call(),
        ),
      ],
    );
  }
}
