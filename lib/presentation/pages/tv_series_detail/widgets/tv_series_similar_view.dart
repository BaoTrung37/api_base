import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:api_base/presentation/pages/show_all/screen/show_all_screen.dart';
import 'package:api_base/presentation/pages/tv_series_detail/screen/tv_series_detail_screen.dart';
import 'package:api_base/presentation/utilities/utilities.dart';
import 'package:api_base/presentation/widgets/app_list_view/media_horizontal_list_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesSimilarView extends StatelessWidget {
  const TvSeriesSimilarView({
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
            argument: ShowAllArgument.tvSeries(
              title: 'Similar',
              mediaId: media?.id,
              apiTvSeriesType: ApiTvSeriesType.similar,
            ),
          ),
        );
      },
      onMediaTap: (mediaId) {
        context.pushRoute(
          TvSeriesDetailRoute(
            argument: TvSeriesDetailArgument(
              seriesId: mediaId,
            ),
          ),
        );
      },
    );
  }
}
