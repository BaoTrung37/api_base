import 'package:api_base/presentation/widgets/base_app_bar/base_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'People',
        isCenterTitle: false,
        shouldShowBottomDivider: false,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Text('Popular'),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: 24.verticalSpace,
          ),
        ],
      ),
    );
  }
}
