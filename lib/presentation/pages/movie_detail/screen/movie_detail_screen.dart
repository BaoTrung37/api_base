// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/movie_detail/widgets/widgets.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            16.horizontalSpace,
          ],
        ),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          bloc: movieDetailCubit,
          builder: (context, state) {
            return LoadingView(
              status: state.status,
              child: _MainContent(
                movieDetailCubit: movieDetailCubit,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    required this.movieDetailCubit,
  });

  final MovieDetailCubit movieDetailCubit;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MovieInformationView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        FilmCastCrewView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        VideoTrailerView(movieDetailCubit: movieDetailCubit),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _MovieInformationOther(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        SimilarMovieView(movieDetailCubit: movieDetailCubit),
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
                  descriptions: (state.movie?.spokenLanguages ?? [])
                      .where((element) => element.englishName.isNotEmpty)
                      .map((e) => e.englishName)
                      .toList(),
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
