import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/injection/di.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ApiTestScreen extends StatelessWidget {
  const ApiTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(' Api Base'),
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
                final response =
                    await getIt<PostCreateRequestTokenUseCase>().run();

                await launchUrl(
                  Uri.parse(
                      'https://www.themoviedb.org/auth/access?request_token=${response.requestToken}'),
                  mode: LaunchMode.externalApplication,
                );
                // await getIt<SharedPreferencesManager>()
                //     .saveRequestToken(token: response.requestToken);
              },
            ),
            TextButton(
              child: const Text('Get Access Token Session'),
              onPressed: () async {
                final requestTokenResponse =
                    await getIt<PostCreateRequestTokenUseCase>().run();

                await launchUrl(
                  Uri.parse(
                      'https://www.themoviedb.org/auth/access?request_token=${requestTokenResponse.requestToken}'),
                  mode: LaunchMode.externalApplication,
                );
                final response =
                    await getIt<PostCreateAccessTokenUseCase>().run(
                  PostCreateAccessTokenInput(
                    requestToken: requestTokenResponse.requestToken,
                  ),
                );

                print(response.toString());
              },
            ),
            TextButton(
              child: const Text('Post Create Session'),
              onPressed: () async {
                final response = await getIt<PostCreateSessionUseCase>().run(
                  PostCreateSessionInput(requestToken: 'requestToken'),
                );

                print(response.toString());
              },
            ),
            TextButton(
              child: const Text('Post Create Session With Login'),
              onPressed: () async {
                final response =
                    await getIt<PostLoginWithUsernameAndPasswordUseCase>().run(
                  PostLoginWithUsernameAndPasswordInput(
                    username: 'baotrung',
                    password: '123456789',
                    requestToken: '',
                  ),
                );
                await getIt<SharedPreferencesManager>()
                    .saveRequestToken(token: response.requestToken);

                print(response.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
