// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/credits_response.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastCrewListView extends StatelessWidget {
  const CastCrewListView({
    required this.castList,
    required this.onShowAllTap,
    super.key,
  });

  final List<Cast>? castList;
  final VoidCallback onShowAllTap;

  @override
  Widget build(BuildContext context) {
    if (castList == null && castList!.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }
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
                itemCount: castList!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final cast = castList![index];
                  return _buildCastCrewItem(cast);
                },
                separatorBuilder: (context, index) => 16.horizontalSpace,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCastCrewItem(Cast cast) {
    return SizedBox(
      width: 120.w,
      child: Column(
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
      ),
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
          onTap: onShowAllTap,
        ),
      ],
    );
  }
}
