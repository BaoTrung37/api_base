import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
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
              child: const Text('Get Guest Session'),
              onPressed: () async {
                final response = await getIt<GetGuestSessionUseCase>().run();
                print(response.toString());
              },
            ),
            TextButton(
              child: const Text('Get Request Token Session'),
              onPressed: () async {
                final response = await getIt<GetRequestTokenUseCase>().run();
                await getIt<SharedPreferencesManager>()
                    .saveRequestToken(param: response.requestToken);
                // launchUrl(
                //   Uri.parse(
                //       'https://www.themoviedb.org/authenticate/${response.requestToken}?redirect_to=http://www.yourapp.com'),
                //   mode: LaunchMode.externalApplication,
                // );
                print(response.toString());
              },
            ),
            TextButton(
              child: const Text('Post Create Session'),
              onPressed: () async {
                final response = await getIt<PostCreateSessionUseCase>().run();

                print(response.toString());
              },
            ),
            TextButton(
              child: const Text('Post Create Session With Login'),
              onPressed: () async {
                final response =
                    await getIt<PostCreateSessionWithLoginUseCase>().run(
                  PostCreateSessionInput(
                      username: 'baotrung', password: '123456789'),
                );
                await getIt<SharedPreferencesManager>()
                    .saveRequestToken(param: response.requestToken);

                print(response.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
