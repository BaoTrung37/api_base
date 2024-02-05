// import 'package:api_base/gen/assets.gen.dart';
// import 'package:api_base/presentation/presentation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:readmore/readmore.dart';

// class ShowInformationView extends StatelessWidget {
//   const ShowInformationView({
//     super.key,
//   });

  

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 220.h,
//             width: double.infinity,
//             child: CustomCachedNetworkImage(
//               imageUrl: state.movie?.backdropPath?.tmdbW1280Path,
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(0, -10.h),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.w),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 150.h,
//                     width: 90.w,
//                     child: CustomCachedNetworkImage(
//                       imageUrl: state.movie?.posterPath?.tmdbW500Path,
//                     ),
//                   ),
//                   8.horizontalSpace,
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           state.movie?.title ?? '',
//                           style: AppTextStyles.headingSmall,
//                         ),
//                         4.verticalSpace,
//                         _buildMovieRate(state),
//                         8.verticalSpace,
//                         _buildMovieGenres(context, state),
//                         8.verticalSpace,
//                         ReadMoreText(
//                           state.movie?.overview ?? '',
//                           trimLines: 5,
//                           trimMode: TrimMode.Line,
//                           trimCollapsedText: '.',
//                           trimExpandedText: '.',
//                           callback: (val) {},
//                           moreStyle: AppTextStyles.textMedium,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMovieGenres(BuildContext context, MovieDetailState state) {
//     final genres = state.movie?.genres ?? [];
//     if (genres.isEmpty) {
//       return const SizedBox.shrink();
//     }
//     return Wrap(
//       runSpacing: 8.h,
//       spacing: 8.w,
//       children: genres
//           .map(
//             (e) => Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: context.colors.border,
//                   width: 1.5,
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//               child: Text(
//                 e.name,
//                 style: AppTextStyles.labelMediumLight,
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }

//   Widget _buildMovieRate(MovieDetailState state) {
//     return Row(
//       children: [
//         RatingBar(
//           initialRating: (state.movie?.voteAverage ?? 0) / 10 * 5,
//           direction: Axis.horizontal,
//           allowHalfRating: true,
//           itemCount: 5,
//           ratingWidget: RatingWidget(
//             full: Assets.icons.icStar.svg(),
//             half: Assets.icons.icStarHalf.svg(),
//             empty: Assets.icons.icStarOutline.svg(),
//           ),
//           ignoreGestures: true,
//           itemSize: 12.sp,
//           itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
//           onRatingUpdate: (_) {},
//         ),
//         8.horizontalSpace,
//         Text(
//           '( ${state.movie?.voteCount.toString() ?? '0'} )',
//           style: AppTextStyles.textSmallBold,
//         ),
//         Expanded(
//           child: Center(
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Assets.icons.icStar.svg(height: 12.sp),
//                 8.horizontalSpace,
//                 Text(
//                   state.movie?.voteAverage.toString() ?? '0',
//                   style: AppTextStyles.textMediumBold,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
