// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularMovieCubit>(
          create: (context) => getIt<PopularMovieCubit>()..init(),
        ),
      ],
      child: Scaffold(
        appBar: const BaseAppBar.titleOnly(
          title: 'Movies',
          isCenterTitle: false,
          shouldShowBottomDivider: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<PopularMovieCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  // if (state.movies.isEmpty) {
                  //   return SliverToBoxAdapter(
                  //     child: SizedBox(
                  //       height: 250.h,
                  //       width: double.infinity,
                  //       child: ListView.builder(
                  //         scrollDirection: Axis.horizontal,
                  //         itemBuilder: (context, index) {
                  //           return SizedBox(
                  //             height: 250.h,
                  //             width: 120.w,
                  //             child: Shimmer.fromColors(
                  //               baseColor: Colors.red,
                  //               highlightColor: Colors.yellow,
                  //               child: SizedBox(
                  //                 height: 250.h,
                  //                 width: 120.w,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         itemCount: 1,
                  //       ),
                  //     ),
                  //   );
                  // }
                  return MovieHorizontalListView(
                    headingTitle: 'Popular',
                    movies: state.movies,
                  );
                },
              ),
              SliverToBoxAdapter(child: 16.verticalSpace),
            ],
          ),
        ),
      ),
    );
  }
}
