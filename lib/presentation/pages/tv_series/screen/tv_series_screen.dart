import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/tv_series/cubit/tv_series_controller_cubit.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TvSeriesScreen extends StatelessWidget {
  const TvSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<TvSeriesControllerCubit>()..fetchData(),
        ),
      ],
      child: Scaffold(
        appBar: const BaseAppBar.titleOnly(
          title: 'Tv Shows',
          isCenterTitle: false,
          shouldShowBottomDivider: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<TvSeriesControllerCubit, TvSeriesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return TvSeriesHorizontalListView(
                    headingTitle: 'Airing Today',
                    tvSeriesList: state.airingTodayList,
                    onTvSeriesTap: (seriesId) {
                      context.pushRoute(
                        MediaDetailRoute(
                          argument: MediaDetailArgument(
                            seriesId: seriesId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      // context.pushRoute(
                      //   ShowAllRoute(
                      //     argument: ShowAllArgument.movie(
                      //       title: 'Airing Today',
                      //       apiMovieType: ApiMovieType.popular,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
              BlocBuilder<TvSeriesControllerCubit, TvSeriesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return TvSeriesHorizontalListView(
                    headingTitle: 'On The Air',
                    tvSeriesList: state.onTheAirList,
                    onTvSeriesTap: (seriesId) {
                      context.pushRoute(
                        MediaDetailRoute(
                          argument: MediaDetailArgument(
                            seriesId: seriesId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      // context.pushRoute(
                      //   ShowAllRoute(
                      //     argument: ShowAllArgument.movie(
                      //       title: 'Airing Today',
                      //       apiMovieType: ApiMovieType.popular,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
              BlocBuilder<TvSeriesControllerCubit, TvSeriesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return TvSeriesHorizontalListView(
                    headingTitle: 'Popular',
                    tvSeriesList: state.popularList,
                    onTvSeriesTap: (seriesId) {
                      context.pushRoute(
                        MediaDetailRoute(
                          argument: MediaDetailArgument(
                            seriesId: seriesId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      // context.pushRoute(
                      //   ShowAllRoute(
                      //     argument: ShowAllArgument.movie(
                      //       title: 'Airing Today',
                      //       apiMovieType: ApiMovieType.popular,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
              BlocBuilder<TvSeriesControllerCubit, TvSeriesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return TvSeriesHorizontalListView(
                    headingTitle: 'Top Rated',
                    tvSeriesList: state.topRatedList,
                    onTvSeriesTap: (seriesId) {
                      context.pushRoute(
                        MediaDetailRoute(
                          argument: MediaDetailArgument(
                            seriesId: seriesId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      // context.pushRoute(
                      //   ShowAllRoute(
                      //     argument: ShowAllArgument.movie(
                      //       title: 'Airing Today',
                      //       apiMovieType: ApiMovieType.popular,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
            ],
          ),
        ),
      ),
    );
  }
}
