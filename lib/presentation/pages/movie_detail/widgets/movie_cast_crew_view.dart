// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/presentation/resources/app_text_styles.dart';
import 'package:api_base/presentation/utilities/enums/image_type.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:api_base/presentation/widgets/buttons/see_all_button.dart';
import 'package:api_base/presentation/widgets/images/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCastCrewView extends StatelessWidget {
  const MovieCastCrewView({
    this.media,
    super.key,
  });
  final MediaResponse? media;

  @override
  Widget build(BuildContext context) {
    final casts = media?.credits?.cast.take(15).toList();
    if (casts == null) {
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
                itemCount: casts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final cast = casts[index];
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
          onTap: () {},
        ),
      ],
    );
  }
}
