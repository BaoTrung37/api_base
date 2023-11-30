import 'package:api_base/presentation/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar.titleAndBackButton(title: ''),
      body: Column(
        children: [
          Text('Sign In'),
        ],
      ),
    );
  }
}
