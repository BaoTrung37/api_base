import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    required this.child,
    required this.status,
    this.errorView,
    super.key,
  });

  final Widget child;
  final Widget? errorView;
  final AppStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppStatus.success:
        return child;
      case AppStatus.initial:
      case AppStatus.inProgress:
        return const AppLoadingIndicator();
      case AppStatus.error:
        return errorView ?? Container();
    }
  }
}
