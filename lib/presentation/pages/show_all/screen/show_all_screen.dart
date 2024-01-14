// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAllArgument {
  final String title;
  final int? movieId;
  ShowAllArgument({
    required this.title,
    this.movieId,
  });
}

@RoutePage()
class ShowAllScreen extends StatefulWidget {
  const ShowAllScreen({
    required this.argument,
    super.key,
  });

  final ShowAllArgument argument;

  @override
  State<ShowAllScreen> createState() => _ShowAllScreenState();
}

class _ShowAllScreenState extends State<ShowAllScreen>
    with InfiniteListDelegate {
  late ShowAllCubit showAllCubit;

  @override
  void initState() {
    super.initState();
    showAllCubit = getIt<ShowAllCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => showAllCubit,
      child: Scaffold(
        appBar: BaseAppBar.customTitleView(
          isCenterTitle: false,
          title: Text(
            widget.argument.title,
            style: AppTextStyles.headingSmall
                .copyWith(color: context.colors.textPrimary),
          ),
        ),
        body: BlocBuilder<ShowAllCubit, ShowAllState>(
          bloc: showAllCubit,
          builder: (context, state) {
            return InfiniteListView(
              cellBuilder: (item, index) {
                return _buildCell(item, index);
              },
              getDataSources: (pageKey, perPage) {
                return showAllCubit.getSimilarMoviesData(
                    widget.argument.movieId, pageKey);
              },
              delegate: this,
              separatorBuilder: (context, index) => 16.verticalSpace,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCell(DataSource item, int index) {
    if (item is MovieCell) {
      return _buildMovieCell(item.getData);
    }
    return Container();
  }

  Widget _buildMovieCell(MovieResponse movie) =>
      MovieItemListView(movie: movie);
}