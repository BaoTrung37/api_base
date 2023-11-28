import 'package:api_base/domain/use_cases/authentication/get_guest_session_use_case.dart';
import 'package:api_base/injection/di.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Api Base'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text('Test Session'),
              onPressed: () async {
                final response = await getIt<GetGuestSessionUseCase>().run();
                print(response.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
