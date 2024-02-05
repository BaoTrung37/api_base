import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:api_base/presentation/pages/media_detail/cubit/media_detail_cubit.dart';
import 'package:api_base/presentation/pages/media_detail/screen/media_detail_screen.dart';
import 'package:api_base/presentation/pages/show_all/screen/show_all_screen.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/app_list_view/movie_horizontal_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaSimilarView extends StatelessWidget {
  const MediaSimilarView({
    required this.mediaDetailCubit,
    super.key,
  });
  final MediaDetailCubit mediaDetailCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaDetailCubit, MediaDetailState>(
      bloc: mediaDetailCubit,
      builder: (context, state) {
        final similarList =
            state.media?.similar?.results.take(20).toList() ?? [];
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
                  movieId: state.media?.id,
                  apiMovieType: ApiMovieType.similar,
                ),
              ),
            );
          },
          onMovieTap: (movieId) {
            context.pushRoute(MediaDetailRoute(
                argument: MediaDetailArgument(
              movieId: movieId,
            )));
          },
        );
      },
    );
  }
}
