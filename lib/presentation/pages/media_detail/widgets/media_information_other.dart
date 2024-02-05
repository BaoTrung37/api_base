import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaInformationOther extends StatelessWidget {
  const MediaInformationOther({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
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
                  description: state.movie?.releaseDate,
                ),
                _buildInformationItem(
                  context,
                  title: 'Language',
                  descriptions: (state.movie?.spokenLanguages ?? [])
                      .where((element) => element.englishName.isNotEmpty)
                      .map((e) => e.englishName)
                      .toList(),
                ),
                _buildInformationItem(
                  context,
                  title: 'Revenue',
                  description: '\$${state.movie?.revenue}',
                ),
                _buildInformationItem(
                  context,
                  title: 'Production Companies',
                  descriptions: (state.movie?.productionCompanies ?? [])
                      .map((e) => e.name)
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
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
