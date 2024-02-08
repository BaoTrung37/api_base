// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/media_detail/cubit/media_detail_cubit.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/loading_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaDetailArgument {
  final int mediaId;
  final bool isMovie;
  MediaDetailArgument({
    required this.mediaId,
    this.isMovie = true,
  });
}

@RoutePage()
class MediaDetailScreen extends StatefulWidget {
  const MediaDetailScreen({
    required this.argument,
    super.key,
  });

  final MediaDetailArgument argument;
  @override
  State<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends State<MediaDetailScreen> {
  final MediaDetailCubit mediaDetailCubit = getIt<MediaDetailCubit>();
  @override
  void initState() {
    super.initState();
    mediaDetailCubit.fetchData(widget.argument);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mediaDetailCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          title: Text(
            'Detail',
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
        body: BlocBuilder<MediaDetailCubit, MediaDetailState>(
          bloc: mediaDetailCubit,
          builder: (context, state) {
            return LoadingView(
              status: state.status,
              child: _MainContent(
                mediaDetailCubit: mediaDetailCubit,
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
    required this.mediaDetailCubit,
  });

  final MediaDetailCubit mediaDetailCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaDetailCubit, MediaDetailState>(
      bloc: mediaDetailCubit,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            MediaInformationView(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            MediaCastCrewView(media: state.media),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            MediaTrailerVideoView(mediaDetailCubit: mediaDetailCubit),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            const MediaInformationOther(),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            MediaSimilarView(mediaDetailCubit: mediaDetailCubit),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
          ],
        );
      },
    );
  }
}
