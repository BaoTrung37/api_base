// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/resources/resources.dart';
import 'package:api_base/presentation/utilities/extensions/datetime_extension.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:api_base/presentation/widgets/widgets.dart';
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
    this.showAllTap,
    this.isPoster = true,
  });

  final String headingTitle;
  final List<MovieResponse> movies;

  final double? height;
  final double? width;

  final VoidCallback? showAllTap;
  final MovieFunction onMovieTap;
  final bool isPoster;

  double _getWidthItem(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    if (isPoster) {
      return size * 0.3;
    }
    return size * 0.6;
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _buildHeadingTitle(),
          16.verticalSpace,
          _buildMovieListView(),
        ],
      ),
    );
  }

  Widget _buildMovieListView() {
    return SizedBox(
      height: height ?? 250.h,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return _buildMovieItem(context, movie, onMovieTap);
        },
        itemCount: movies.length,
        separatorBuilder: (context, index) => 16.horizontalSpace,
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
        height: height ?? 250.h,
        width: width ?? _getWidthItem(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomCachedNetworkImage(
                imageUrl: isPoster
                    ? movie.posterPath.tmdbW154Path
                    : movie.backdropPath.tmdbW300Path,
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
                    style: AppTextStyles.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.verticalSpace,
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
          onTap: () => showAllTap,
        ),
      ],
    );
  }
}
