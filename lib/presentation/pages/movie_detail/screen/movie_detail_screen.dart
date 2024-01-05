import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.customTitleView(
        title: Text(
          'Movie Detail',
          style: AppTextStyles.headingSmall
              .copyWith(color: context.colors.textPrimary),
        ),
        isCenterTitle: false,
        widgets: const [
          //
        ],
      ),
      body: const Text(''),
    );
  }
}
