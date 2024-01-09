// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    required this.movieId,
    super.key,
  });

  final int movieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final MovieDetailCubit movieDetailCubit = getIt<MovieDetailCubit>();
  @override
  void initState() {
    super.initState();
    movieDetailCubit.fetchData(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => movieDetailCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          title: Text(
            'Movie Detail',
            style: AppTextStyles.headingSmall
                .copyWith(color: context.colors.textPrimary),
          ),
          isCenterTitle: false,
          widgets: [
            Assets.icons.icFavoriteOutline.svg(height: 24.h),
            16.horizontalSpace,
            Assets.icons.icStarOutline.svg(height: 24.h),
            16.horizontalSpace,
            Assets.icons.icBookmarkOutline.svg(height: 24.h),
          ],
        ),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          bloc: movieDetailCubit,
          builder: (context, state) {
            return LoadingView(
              status: state.status,
              child: const _MainContent(),
            );
          },
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _MovieInformationView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _FilmCastView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _VideoTrailerView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _MovieInformationOther(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _SimilarMovieView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
      ],
    );
  }
}

class _MovieInformationOther extends StatelessWidget {
  const _MovieInformationOther();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Information',
                  style: AppTextStyles.headingXSmall,
                ),
                _buildInformationItem(
                  context,
                  title: 'Release',
                  description: state.movie?.releaseDate,
                ),
                _buildInformationItem(
                  context,
                  title: 'Language',
                  description: 'English',
                ),
                _buildInformationItem(
                  context,
                  title: 'Revenue',
                  description: '\$${state.movie?.revenue}',
                ),
                _buildInformationItem(
                  context,
                  title: 'Production Companies',
                  descriptions: (state.movie?.productionCompanies ?? [])
                      .map((e) => e.name)
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInformationItem(
    BuildContext context, {
    required String title,
    String? description,
    List<String>? descriptions,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: AppTextStyles.textMediumBold,
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (descriptions ?? [description ?? ''])
                  .map(
                    (text) => Text(
                      text,
                      style: AppTextStyles.textMedium.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SimilarMovieView extends StatelessWidget {
  const _SimilarMovieView();

  @override
  Widget build(BuildContext context) {
    return MovieHorizontalListView(
      headingTitle: 'Similar',
      movies: const [],
      onMovieTap: (id) {
        //
      },
    );
  }
}

class _FilmCastView extends StatelessWidget {
  const _FilmCastView();

  @override
  Widget build(BuildContext context) {
    return const PeopleHorizontalListView();
  }
}

class _VideoTrailerView extends StatelessWidget {
  const _VideoTrailerView();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Videos',
              style: AppTextStyles.headingSmall,
            ),
            16.verticalSpace,
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCachedNetworkImage(
                        height: 80.r,
                        width: 150.r,
                        imageUrl: AppConstant.posterUrl,
                        isBorder: true,
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
}

class _MovieInformationView extends StatelessWidget {
  const _MovieInformationView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      buildWhen: (previous, current) => previous.movie != current.movie,
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 220.h,
                width: double.infinity,
                child: CustomCachedNetworkImage(
                  imageUrl: state.movie?.backdropPath.tmdbW1280Path,
                ),
              ),
              Transform.translate(
                offset: Offset(0, -10.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150.h,
                        width: 90.w,
                        child: CustomCachedNetworkImage(
                          imageUrl: state.movie?.posterPath.tmdbW500Path,
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movie?.title ?? '',
                              style: AppTextStyles.headingSmall,
                            ),
                            4.verticalSpace,
                            _buildMovieRate(state),
                            8.verticalSpace,
                            _buildMovieGenres(context, state),
                            8.verticalSpace,
                            ReadMoreText(
                              state.movie?.overview ?? '',
                              trimLines: 5,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '.',
                              trimExpandedText: '.',
                              callback: (val) {
                                print(val);
                              },
                              moreStyle: AppTextStyles.textMedium,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMovieGenres(BuildContext context, MovieDetailState state) {
    final genres = state.movie?.genres ?? [];
    if (genres.isEmpty) {
      return const SizedBox.shrink();
    }
    return Wrap(
      runSpacing: 8.h,
      spacing: 8.w,
      children: genres
          .map(
            (e) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colors.border,
                  width: 1.5,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Text(
                e.name,
                style: AppTextStyles.labelMediumLight,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildMovieRate(MovieDetailState state) {
    return Row(
      children: [
        RatingBar(
          initialRating: (state.movie?.voteAverage ?? 0) / 10 * 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: Assets.icons.icStar.svg(),
            half: Assets.icons.icStarHalf.svg(),
            empty: Assets.icons.icStarOutline.svg(),
          ),
          ignoreGestures: true,
          itemSize: 12.sp,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
          onRatingUpdate: (_) {},
        ),
        8.horizontalSpace,
        Text(
          state.movie?.voteCount.toString() ?? '0',
          style: AppTextStyles.textSmallBold,
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.icStar.svg(height: 12.sp),
                8.horizontalSpace,
                Text(
                  state.movie?.voteAverage.toString() ?? '0',
                  style: AppTextStyles.textMediumBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
