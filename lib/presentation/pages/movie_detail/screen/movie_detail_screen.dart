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
        const MovieInformationOther(),
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
