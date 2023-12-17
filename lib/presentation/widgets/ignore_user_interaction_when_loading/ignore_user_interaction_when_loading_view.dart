import 'package:api_base/presentation/utilities/enums/enums.dart';
import 'package:flutter/material.dart';

class IgnoreUserInteractionWhenLoadingView extends StatelessWidget {
  const IgnoreUserInteractionWhenLoadingView({
    required this.status,
    required this.child,
    super.key,
  });

  final LoadingStatus status;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: status == LoadingStatus.inProgress,
      child: child,
    );
  }
}
