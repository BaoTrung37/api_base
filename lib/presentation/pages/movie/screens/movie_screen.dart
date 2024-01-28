// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/injection/di.dart';
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
              BlocBuilder<MoviesControllerCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return MovieHorizontalListView(
                    headingTitle: 'Popular',
                    movies: state.popularMovies,
                    onMovieTap: (movieId) {
                      context.pushRoute(MovieDetailRoute(movieId: movieId));
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
              BlocBuilder<MoviesControllerCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.nowPlayingMovies;
                  return MovieHorizontalListView(
                    headingTitle: 'Playing In Theatres',
                    movies: movies,
                    isPoster: false,
                    onMovieTap: (movieId) {
                      context.pushRoute(MovieDetailRoute(movieId: movieId));
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
              BlocBuilder<MoviesControllerCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.trendingMovies;
                  return MovieHorizontalListView(
                    headingTitle: 'Trending',
                    movies: movies,
                    onMovieTap: (movieId) {
                      context.pushRoute(MovieDetailRoute(movieId: movieId));
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
              BlocBuilder<MoviesControllerCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  final movies = state.upcomingMovies;
                  return MovieHorizontalListView(
                    headingTitle: 'Upcoming',
                    movies: movies,
                    onMovieTap: (movieId) {
                      context.pushRoute(MovieDetailRoute(movieId: movieId));
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
