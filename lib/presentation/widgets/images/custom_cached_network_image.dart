// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imageUrl,
    this.isBorder = false,
    this.isCircleImage = false,
    this.height,
    this.width,
    this.imageType = ImageType.normal,
  });

  final String? imageUrl;
  final bool isBorder;
  final bool isCircleImage;
  final double? height;
  final double? width;

  final ImageType imageType;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (imageUrl == null) {
        return Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: context.colors.border,
                  )
                : null,
            shape: isCircleImage ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: Center(
            child: imageType.imageError.svg(height: 40.h),
          ),
        );
      }
      return CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        fadeInCurve: Curves.easeIn,
        alignment: Alignment.center,
        height: height,
        width: width,
        fadeInDuration: const Duration(milliseconds: 300),
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              border: isBorder
                  ? Border.all(
                      color: context.colors.border,
                    )
                  : null,
              shape: isCircleImage ? BoxShape.circle : BoxShape.rectangle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: context.colors.border,
                  )
                : null,
            shape: isCircleImage ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: Center(
            child: imageType.imageError.svg(height: 40.h),
          ),
        ),
      );
    });
  }
}
