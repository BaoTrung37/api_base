// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:api_base/presentation/pages/movie_detail/widgets/widgets.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/loading_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailArgument {
  MovieDetailArgument({required this.movieId});

  final int movieId;
}

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    required this.argument,
    super.key,
  });

  final MovieDetailArgument argument;
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final MovieDetailCubit movieDetailCubit = getIt<MovieDetailCubit>();
  @override
  void initState() {
    super.initState();
    movieDetailCubit.fetchData(widget.argument);
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
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: movieDetailCubit,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            MovieInformationView(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            CastCrewListView(
              castList: state.media?.credits?.cast.take(15).toList(),
              onShowAllTap: () {
                //
              },
            ),
            // SliverToBoxAdapter(
            //   child: 24.verticalSpace,
            // ),
            // const MovieTrailerVideoView(),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            MovieInformationOther(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            MovieSimilarView(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
          ],
        );
      },
    );
  }
}
