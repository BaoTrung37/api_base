// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/movie_detail/screen/movie_detail_screen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAllArgument {
  final String title;
  final int? mediaId;
  final ApiMovieType? apiMovieType;
  final ApiPeopleType? apiPeopleType;
  final ApiTvSeriesType? apiTvSeriesType;

  ShowAllArgument.movie({
    required this.title,
    required this.apiMovieType,
    this.mediaId,
  })  : apiPeopleType = null,
        apiTvSeriesType = null;

  ShowAllArgument.people({
    required this.title,
    required this.apiPeopleType,
    this.mediaId,
  })  : apiMovieType = null,
        apiTvSeriesType = null;

  ShowAllArgument.tvSeries({
    required this.title,
    required this.apiTvSeriesType,
    this.mediaId,
  })  : apiMovieType = null,
        apiPeopleType = null;
}

@RoutePage()
class ShowAllScreen extends StatefulWidget {
  const ShowAllScreen({
    required this.argument,
    super.key,
  });

  final ShowAllArgument argument;

  @override
  State<ShowAllScreen> createState() => _ShowAllScreenState();
}

class _ShowAllScreenState extends State<ShowAllScreen>
    with InfiniteListDelegate {
  late ShowAllCubit showAllCubit;

  void navigateToMovieDetailView(int movieId) {
    context.pushRoute(
      MovieDetailRoute(
        argument: MovieDetailArgument(
          movieId: movieId,
        ),
      ),
    );
  }

  void navigateToTvSeriesDetailView(int seriesId) {
    context.pushRoute(
      TvSeriesDetailRoute(
        argument: TvSeriesDetailArgument(
          seriesId: seriesId,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    showAllCubit = getIt<ShowAllCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => showAllCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          isCenterTitle: false,
          title: Text(
            widget.argument.title,
            style: AppTextStyles.headingSmall
                .copyWith(color: context.colors.textPrimary),
          ),
        ),
        body: BlocBuilder<ShowAllCubit, ShowAllState>(
          bloc: showAllCubit,
          builder: (context, state) {
            return InfiniteListView(
              cellBuilder: (item, index) {
                return _buildCell(item, index);
              },
              getDataSources: (pageKey, perPage) {
                return showAllCubit.fetchData(widget.argument, pageKey);
              },
              delegate: this,
              separatorBuilder: (context, index) => 16.verticalSpace,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCell(DataSource item, int index) {
    if (item is MovieCell) {
      return _buildMovieCell(item.getData);
    } else if (item is TvSeriesCell) {
      return _buildTvSeriesCell(item.getData);
    }
    return Container();
  }

  Widget _buildMovieCell(MediaResponse movie) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: MovieItemListView(
          movie: movie,
          onMovieTap: () => navigateToMovieDetailView(movie.id),
        ),
      );
  Widget _buildTvSeriesCell(MediaResponse tvSeries) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: TvSeriesItemListView(
          tvSeries: tvSeries,
          onTvSeriesTap: () => navigateToTvSeriesDetailView(tvSeries.id),
        ),
      );
}
