// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'Movies',
        isCenterTitle: false,
        shouldShowBottomDivider: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            const HorizontalListView(
              headingTitle: '',
            ),
            SliverToBoxAdapter(child: 16.verticalSpace),
          ],
        ),
      ),
    );
  }
}
