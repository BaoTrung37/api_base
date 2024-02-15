// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaInformationOther extends StatelessWidget {
  const MediaInformationOther({
    super.key,
    this.media,
  });

  final MediaResponse? media;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
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
              description: media?.releaseDate,
            ),
            _buildInformationItem(
              context,
              title: 'Language',
              descriptions: (media?.spokenLanguages ?? [])
                  .where((element) => element.englishName.isNotEmpty)
                  .map((e) => e.englishName)
                  .toList(),
            ),
            _buildInformationItem(
              context,
              title: 'Revenue',
              description: '\$${media?.revenue}',
            ),
            _buildInformationItem(
              context,
              title: 'Production Companies',
              descriptions: (media?.productionCompanies ?? [])
                  .map((e) => e.name)
                  .toList(),
            ),
          ],
        ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
