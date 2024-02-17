// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/tv_series_detail/cubit/tv_series_detail_cubit.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/loading_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesDetailArgument {
  TvSeriesDetailArgument({required this.seriesId});

  final int seriesId;
}

@RoutePage()
class TvSeriesDetailScreen extends StatefulWidget {
  const TvSeriesDetailScreen({
    required this.argument,
    super.key,
  });

  final TvSeriesDetailArgument argument;
  @override
  State<TvSeriesDetailScreen> createState() => _TvSeriesDetailScreenState();
}

class _TvSeriesDetailScreenState extends State<TvSeriesDetailScreen> {
  final TvSeriesDetailCubit tvSeriesDetailCubit = getIt<TvSeriesDetailCubit>();
  @override
  void initState() {
    super.initState();
    tvSeriesDetailCubit.fetchData(widget.argument);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tvSeriesDetailCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          title: Text(
            'Tv Series Detail',
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
        body: BlocBuilder<TvSeriesDetailCubit, TvSeriesDetailState>(
          bloc: tvSeriesDetailCubit,
          builder: (context, state) {
            return LoadingView(
              status: state.status,
              child: _MainContent(
                tvSeriesDetailCubit: tvSeriesDetailCubit,
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
    required this.tvSeriesDetailCubit,
  });

  final TvSeriesDetailCubit tvSeriesDetailCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesDetailCubit, TvSeriesDetailState>(
      bloc: tvSeriesDetailCubit,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            TvSeriesInformationView(media: state.media),
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
            // const TvSeriesTrailerVideoView(),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            TvSeriesInformationOther(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            TvSeriesSimilarView(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
          ],
        );
      },
    );
  }
}
