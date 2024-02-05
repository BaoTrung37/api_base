import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaCastCrewView extends StatelessWidget {
  const MediaCastCrewView({
    required this.movieDetailCubit,
    super.key,
  });
  final MovieDetailCubit movieDetailCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: movieDetailCubit,
      builder: (context, state) {
        final casts = state.movie?.credits?.cast.take(15).toList() ?? [];
        return SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                _buildHeadingTitle(),
                16.verticalSpace,
                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                    itemCount: casts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final cast = casts[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCachedNetworkImage(
                            height: 100.r,
                            width: 100.r,
                            isBorder: true,
                            imageUrl: cast.profilePath?.tmdbW300Path,
                            imageType: ImageType.profile,
                            isCircleImage: true,
                          ),
                          const Spacer(),
                          Text(
                            cast.originalName,
                            style: AppTextStyles.textMediumBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            cast.character ?? '',
                            style: AppTextStyles.textSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
      },
    );
  }

  Widget _buildHeadingTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Cast & Crew',
          style: AppTextStyles.headingSmall,
        ),
        SeeAllButton(
          onTap: () {},
        ),
      ],
    );
  }
}
