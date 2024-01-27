// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef MovieFunction = Function(int movieId);

class MovieHorizontalListView extends StatelessWidget {
  const MovieHorizontalListView({
    required this.headingTitle,
    required this.movies,
    required this.onMovieTap,
    super.key,
    this.height,
    this.width,
    this.padding,
    this.showAllTap,
    this.isPoster = true,
  });

  final String headingTitle;
  final List<MovieResponse> movies;

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? showAllTap;
  final MovieFunction onMovieTap;
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
            if (movies.isNotEmpty)
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
        ),
        itemBuilder: (context, index, pageViewIndex) {
          final movie = movies[index];
          return _buildMovieItem(context, movie, onMovieTap);
        },
        itemCount: movies.length,
      ),
    );
  }

  Widget _buildMovieItem(
    BuildContext context,
    MovieResponse movie,
    MovieFunction onMovieTap,
  ) {
    return GestureDetector(
      onTap: () {
        onMovieTap.call(movie.id);
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
                    ? movie.posterPath?.tmdbW154Path
                    : movie.backdropPath?.tmdbW300Path,
              ),
            ),
            8.verticalSpace,
            SizedBox(
              height: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: AppTextStyles.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
                  Text(
                    movie.genresName,
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
