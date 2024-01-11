// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListView extends StatelessWidget {
  const LoadingListView({
    super.key,
    this.height,
    this.width,
    this.isHorizontalScroll = true,
  });
  final double? height;
  final double? width;
  final bool isHorizontalScroll;

  @override
  Widget build(BuildContext context) {
    final heightA = height ?? 100.h;
    final widthA = width ?? 80.w;
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: heightA,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: isHorizontalScroll ? Axis.horizontal : Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                height: heightA,
                width: widthA,
              ),
            );
          },
          itemCount: 10,
          separatorBuilder: (context, index) => 16.horizontalSpace,
        ),
      ),
    );
  }
}
