import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:flutter/material.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    required this.child,
    required this.status,
    super.key,
  });

  final Widget child;
  final AppStatus status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: status == AppStatus.inProgress,
          child: child,
        ),
        Positioned.fill(
          child: Visibility(
            visible: status == AppStatus.inProgress,
            child: const AppLoadingIndicator(),
          ),
        ),
      ],
    );
  }
}
