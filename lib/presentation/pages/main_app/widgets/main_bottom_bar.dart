import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/pages/main_app/cubit/bottom_tab_cubit.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabItem {
  TabItem({required this.iconPath, required this.text, this.tabView});

  final String iconPath;
  final String text;
  final Widget? tabView;
}

class MainBottomBar extends StatelessWidget {
  const MainBottomBar({
    required this.tabs,
    super.key,
  });

  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<BottomTabCubit, int>(
          buildWhen: (previous, current) => previous != current,
          builder: (BuildContext context, int page) {
            return AnimatedBottomNavigationBar.builder(
              itemCount: tabs.length,
              tabBuilder: (int index, bool isActive) {
                return _TabBarItem(
                  tabItem: tabs[index],
                  isSelected: page == index,
                );
              },
              // backgroundGradient: Palette.bottomNavigation,
              height: 90.h,
              activeIndex: page,
              gapLocation: GapLocation.none,
              leftCornerRadius: 20.r,
              rightCornerRadius: 20.r,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    context.replaceRoute(const HomeRoute());
                    break;
                  case 1:
                    context.replaceRoute(const HomeRoute());
                    break;
                  case 2:
                    context.replaceRoute(const HomeRoute());
                    break;
                  case 3:
                    context.replaceRoute(const HomeRoute());
                    break;
                }
                getIt<BottomTabCubit>().changeTab(index);
              },
              splashRadius: 0,
              safeAreaValues: const SafeAreaValues(bottom: false),
              //other params
            );
          },
        ),
      ],
    );
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({
    required this.tabItem,
    this.isSelected = false,
  });
  final bool isSelected;
  final TabItem tabItem;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // if (isSelected)
        //   Container(
        //     height: 2.h,
        //     width: 40.w,
        //     decoration: BoxDecoration(
        //       color: Palette.primary,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: const Radius.circular(4).r,
        //         bottomRight: const Radius.circular(4).r,
        //       ),
        //     ),
        //   ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              tabItem.iconPath,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.black : Colors.green,
                BlendMode.srcIn,
              ),
            ),
            8.verticalSpace,
            Text(
              tabItem.text,
              style: AppTextStyles.labelSmall.copyWith(
                color: isSelected ? Colors.black : Colors.green,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
