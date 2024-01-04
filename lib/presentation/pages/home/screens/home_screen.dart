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
                  return MovieHorizontalListView(
                    headingTitle: 'Popular',
                    movies: state.movies,
                    onMovieTap: (movieId) {
                      context.pushRoute(const MovieDetailRoute());
                    },
                  );
                },
              ),
              SliverToBoxAdapter(child: 24.verticalSpace),
              BlocBuilder<PopularMovieCubit, MovieState>(
                buildWhen: (previous, current) =>
                    previous.status != current.status,
                builder: (context, state) {
                  return MovieHorizontalListView(
                    headingTitle: 'Playing In Theatres',
                    movies: state.movies,
                    isPoster: false,
                    onMovieTap: (movieId) {
                      context.pushRoute(const MovieDetailRoute());
                    },
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
