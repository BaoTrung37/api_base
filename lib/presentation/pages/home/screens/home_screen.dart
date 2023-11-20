import 'package:api_base/domain/use_cases/utils/get_genres_use_case.dart';
import 'package:api_base/domain/use_cases/utils/get_lists_use_case.dart';
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
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<String?>?>(
              future: getIt<GetGenresUseCase>().run(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }
                final list = snapshot.data ?? [];
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Text('genres $index: ${list[index]}');
                    },
                  ),
                );
              },
            ),
            FutureBuilder<List<String?>?>(
              future: getIt<GetListsUseCase>().run(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }
                final list = snapshot.data ?? [];
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Text('lists-$index: ${list[index]}');
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
