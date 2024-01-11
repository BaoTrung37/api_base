// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class InfinityListArgument {
  final String title;
  InfinityListArgument({
    required this.title,
  });
}

@RoutePage()
class InfinityListScreen extends StatelessWidget {
  const InfinityListScreen({
    required this.argument,
    super.key,
  });

  final InfinityListArgument argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        isCenterTitle: false,
        title: Text(
          argument.title,
          style: AppTextStyles.headingSmall
              .copyWith(color: context.colors.textPrimary),
        ),
      ),
      body: Container(),
    );
  }
}
