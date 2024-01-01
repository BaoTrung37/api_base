import 'package:api_base/presentation/presentation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar.titleOnly(
        title: 'Profile',
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.replaceRoute(const SignInRoute());
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In/ Sign Up',
                  style: AppTextStyles.textLargeBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
