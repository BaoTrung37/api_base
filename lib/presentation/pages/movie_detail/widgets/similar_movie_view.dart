import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:api_base/presentation/pages/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:api_base/presentation/pages/show_all/screen/show_all_screen.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/app_list_view/movie_horizontal_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMovieView extends StatelessWidget {
  const SimilarMovieView({
    required this.movieDetailCubit,
    super.key,
  });
  final MovieDetailCubit movieDetailCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: movieDetailCubit,
      builder: (context, state) {
        final similarList =
            state.movie?.similar?.results.take(20).toList() ?? [];
        if (similarList.isEmpty) {
          return const SizedBox.shrink();
        }
        return MovieHorizontalListView(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          headingTitle: 'Similar',
          movies: similarList,
          showAllTap: () {
            context.pushRoute(
              ShowAllRoute(
                argument: ShowAllArgument.movie(
                  title: 'Similar',
                  movieId: state.movie?.id,
                  apiMovieType: ApiMovieType.similar,
                ),
              ),
            );
          },
          onMovieTap: (movieId) {
            context.pushRoute(MovieDetailRoute(movieId: movieId));
          },
        );
      },
    );
  }
}
