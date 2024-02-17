// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/movie/cubit/movies_controller_cubit.dart';
import 'package:api_base/presentation/pages/movie_detail/screen/movie_detail_screen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesControllerCubit>(
          create: (context) => getIt<MoviesControllerCubit>()..fetchData(),
        ),
      ],
      child: Scaffold(
        appBar: const BaseAppBar.titleOnly(
          title: 'Movies',
          isCenterTitle: false,
          shouldShowBottomDivider: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<MoviesControllerCubit, MoviesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return MediaHorizontalListView(
                    headingTitle: 'Popular',
                    medias: state.popularMovies,
                    onMediaTap: (movieId) {
                      context.pushRoute(
                        MovieDetailRoute(
                          argument: MovieDetailArgument(
                            movieId: movieId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      context.pushRoute(
                        ShowAllRoute(
                          argument: ShowAllArgument.movie(
                            title: 'Popular',
                            apiMovieType: ApiMovieType.popular,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
              BlocBuilder<MoviesControllerCubit, MoviesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.nowPlayingMovies;
                  return MediaHorizontalListView(
                    headingTitle: 'Playing In Theatres',
                    medias: movies,
                    isPoster: false,
                    onMediaTap: (movieId) {
                      context.pushRoute(
                        MovieDetailRoute(
                          argument: MovieDetailArgument(
                            movieId: movieId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      context.pushRoute(
                        ShowAllRoute(
                          argument: ShowAllArgument.movie(
                            title: 'Playing In Theatres',
                            apiMovieType: ApiMovieType.playingNow,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 16.verticalSpace),
              BlocBuilder<MoviesControllerCubit, MoviesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.trendingMovies;
                  return MediaHorizontalListView(
                    headingTitle: 'Trending',
                    medias: movies,
                    onMediaTap: (movieId) {
                      context.pushRoute(
                        MovieDetailRoute(
                          argument: MovieDetailArgument(
                            movieId: movieId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      context.pushRoute(
                        ShowAllRoute(
                          argument: ShowAllArgument.movie(
                            title: 'Trending Movies',
                            apiMovieType: ApiMovieType.trending,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 16.verticalSpace),
              BlocBuilder<MoviesControllerCubit, MoviesControllerState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.upcomingMovies;
                  return MediaHorizontalListView(
                    headingTitle: 'Upcoming',
                    medias: movies,
                    onMediaTap: (movieId) {
                      context.pushRoute(
                        MovieDetailRoute(
                          argument: MovieDetailArgument(
                            movieId: movieId,
                          ),
                        ),
                      );
                    },
                    showAllTap: () {
                      context.pushRoute(
                        ShowAllRoute(
                          argument: ShowAllArgument.movie(
                            title: 'Upcoming',
                            apiMovieType: ApiMovieType.upcoming,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
