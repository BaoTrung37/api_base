import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        title: Text(
          'Movie Detail',
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
        ],
      ),
      body: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const _MovieInformationView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _FilmCastView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _VideoTrailerView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _MovieInformationOther(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
        const _SimilarMovieView(),
        SliverToBoxAdapter(
          child: 24.verticalSpace,
        ),
      ],
    );
  }
}

class _MovieInformationOther extends StatelessWidget {
  const _MovieInformationOther();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Information',
            style: AppTextStyles.headingXSmall,
          ),
          _buildInformationItem(
            context,
            title: 'Release',
            description: '14 December 2023',
          ),
          _buildInformationItem(
            context,
            title: 'Language',
            description: 'English',
          ),
          _buildInformationItem(
            context,
            title: 'Revenue',
            description: '\$208M',
          ),
          _buildInformationItem(
            context,
            title: 'Revenue',
            description: '\$208M',
          ),
        ],
      ),
    );
  }

  Widget _buildInformationItem(
    BuildContext context, {
    required String title,
    String? description,
    List<String>? descriptions,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: AppTextStyles.textMediumBold,
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: (descriptions ?? [description ?? ''])
                  .map(
                    (text) => Text(
                      text,
                      style: AppTextStyles.textMedium.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SimilarMovieView extends StatelessWidget {
  const _SimilarMovieView();

  @override
  Widget build(BuildContext context) {
    return MovieHorizontalListView(
      headingTitle: 'Similar',
      movies: const [],
      onMovieTap: (id) {
        //
      },
    );
  }
}

class _FilmCastView extends StatelessWidget {
  const _FilmCastView();

  @override
  Widget build(BuildContext context) {
    return const PeopleHorizontalListView();
  }
}

class _VideoTrailerView extends StatelessWidget {
  const _VideoTrailerView();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Videos',
              style: AppTextStyles.headingSmall,
            ),
            16.verticalSpace,
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCachedNetworkImage(
                        height: 100.r,
                        width: 150.r,
                        imageUrl: AppConstant.posterUrl,
                        isBorder: true,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => 16.horizontalSpace,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieInformationView extends StatelessWidget {
  const _MovieInformationView();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: CustomCachedNetworkImage(
              imageUrl: AppConstant.backdropUrl,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -10.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150.h,
                    width: 90.w,
                    child: CustomCachedNetworkImage(
                      imageUrl: AppConstant.posterUrl,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The Family Plan The Family Plan The Family Plan',
                          style: AppTextStyles.headingSmall,
                        ),
                        8.verticalSpace,
                        _buildMovieRate(),
                        16.verticalSpace,
                        const Text(
                          "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
                          style: AppTextStyles.textMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieRate() {
    return Row(
      children: [
        RatingBar(
          initialRating: 2.4,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: Assets.icons.icStar.svg(),
            half: Assets.icons.icStarHalf.svg(),
            empty: Assets.icons.icStarOutline.svg(),
          ),
          ignoreGestures: true,
          itemSize: 12.sp,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
          onRatingUpdate: (_) {},
        ),
        8.horizontalSpace,
        const Text(
          '(100)',
          style: AppTextStyles.textSmallBold,
        ),
        Expanded(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.icStar.svg(height: 12.sp),
                8.horizontalSpace,
                const Text(
                  '9.5',
                  style: AppTextStyles.textMediumBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
