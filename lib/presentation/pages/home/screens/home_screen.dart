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
    getIt.get<PopularMovieCubit>().init();
  }

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
            BlocBuilder<PopularMovieCubit, MovieState>(
              bloc: getIt.get<PopularMovieCubit>(),
              buildWhen: (previous, current) =>
                  previous.movies != current.movies,
              builder: (context, state) {
                return HorizontalListView(
                  headingTitle: 'Popular',
                  movies: state.movies,
                );
              },
            ),
            SliverToBoxAdapter(child: 16.verticalSpace),
          ],
        ),
      ),
    );
  }
}
