// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return LoadingView(
              status: state.status,
              child: InfiniteListView(
                cellBuilder: (item, index) {
                  return Container(
                    child: Text('$index'),
                  );
                },
                getDataSources: (pageKey, perPage) {
                  return showAllCubit.getSimilarMoviesData(
                      widget.argument.movieId, pageKey);
                },
                delegate: this,
              ),
            );
          },
        ),
      ),
    );
  }
}
