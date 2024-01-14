// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/utilities/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItemListView extends StatelessWidget {
  const MovieItemListView({
    required this.movie,
    super.key,
  });

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCachedNetworkImage(
          height: 120.h,
          width: 80.w,
          imageUrl: movie.posterPath.tmdbW300Path,
          imageType: ImageType.movie,
          isBorder: true,
        ),
        16.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: AppTextStyles.textLargeBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
