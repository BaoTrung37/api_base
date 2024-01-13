// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ShowAllArgument {
  final String title;
  ShowAllArgument({
    required this.title,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        isCenterTitle: false,
        title: Text(
          widget.argument.title,
          style: AppTextStyles.headingSmall
              .copyWith(color: context.colors.textPrimary),
        ),
      ),
      body: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    return InfiniteListView(
      cellBuilder: (item, index) {
        return Container();
      },
      getDataSources: (pageKey, perPage) {
        return Future.delayed(Duration.zero, () {
          return [];
        });
      },
      perPage: 1,
    );
  }
}
