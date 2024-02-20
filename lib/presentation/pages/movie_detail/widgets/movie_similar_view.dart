import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:api_base/presentation/pages/movie_detail/screen/movie_detail_screen.dart';
import 'package:api_base/presentation/pages/show_all/screen/show_all_screen.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/app_list_view/media_horizontal_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieSimilarView extends StatelessWidget {
  const MovieSimilarView({
    this.media,
    super.key,
  });
  final MediaResponse? media;
  @override
  Widget build(BuildContext context) {
    final similarList = media?.similar?.results.take(20).toList();
    if (similarList == null) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }
    return MediaHorizontalListView(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      headingTitle: 'Similar',
      medias: similarList,
      showAllTap: () {
        context.pushRoute(
          ShowAllRoute(
            argument: ShowAllArgument.movie(
              title: 'Similar',
              movieId: media?.id,
              apiMovieType: ApiMovieType.similar,
            ),
          ),
        );
      },
      onMediaTap: (movieId) {
        context.pushRoute(
          MovieDetailRoute(
            argument: MovieDetailArgument(
              movieId: movieId,
            ),
          ),
        );
      },
    );
  }
}
