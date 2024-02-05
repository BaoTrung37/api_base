// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef TvSeriesFunction = Function(int seriesId);

class TvSeriesHorizontalListView extends StatelessWidget {
  const TvSeriesHorizontalListView({
    required this.headingTitle,
    required this.tvSeriesList,
    required this.onTvSeriesTap,
    super.key,
    this.height,
    this.width,
    this.padding,
    this.showAllTap,
    this.isPoster = true,
  });

  final String headingTitle;
  final List<MediaResponse> tvSeriesList;

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? showAllTap;
  final TvSeriesFunction onTvSeriesTap;
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
            _buildHeadingTitle(),
            16.verticalSpace,
            if (tvSeriesList.isNotEmpty)
              _buildMovieListView()
            else
              LoadingListView(
                height: height ?? _getHeightItem(),
                width: width ?? _getWidthItem(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieListView() {
    return SizedBox(
      height: height ?? _getHeightItem(),
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          viewportFraction: isPoster ? 0.35 : 0.5,
          // autoPlay: true,
          // autoPlayInterval: const Duration(seconds: 3),
          // autoPlayAnimationDuration: const Duration(milliseconds: 800),
          // autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemBuilder: (context, index, pageViewIndex) {
          final tvSeries = tvSeriesList[index];
          return _buildTvSeriesItem(context, tvSeries, onTvSeriesTap);
        },
        itemCount: tvSeriesList.length,
      ),
    );
  }

  Widget _buildTvSeriesItem(
    BuildContext context,
    MediaResponse tvSeries,
    TvSeriesFunction onMovieTap,
  ) {
    return GestureDetector(
      onTap: () {
        onMovieTap.call(tvSeries.id);
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
                    ? tvSeries.backdropPath.tmdbW500Path
                    : tvSeries.backdropPath.tmdbW500Path,
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tvSeries.name!,
                    style: AppTextStyles.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  Text(
                    tvSeries.genresName,
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
