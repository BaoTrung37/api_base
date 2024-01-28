import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TvShowsScreen extends StatelessWidget {
  const TvShowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<PopularMovieCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: Scaffold(
        appBar: const BaseAppBar.titleOnly(title: 'Tv Shows'),
        body: CustomScrollView(
          slivers: [
            BlocBuilder<PopularMovieCubit, MovieState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return MovieHorizontalListView(
                  headingTitle: 'Popular',
                  movies: state.movies,
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
          ],
        ),
      ),
    );
  }
}
