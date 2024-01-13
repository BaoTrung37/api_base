// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ApiTestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApiTestScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LetInYouRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LetInYouScreen(),
      );
    },
    MainAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAppScreen(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailScreen(
          movieId: args.movieId,
          key: args.key,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ShowAllRoute.name: (routeData) {
      final args = routeData.argsAs<ShowAllRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShowAllScreen(
          argument: args.argument,
          key: args.key,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [ApiTestScreen]
class ApiTestRoute extends PageRouteInfo<void> {
  const ApiTestRoute({List<PageRouteInfo>? children})
      : super(
          ApiTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiTestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LetInYouScreen]
class LetInYouRoute extends PageRouteInfo<void> {
  const LetInYouRoute({List<PageRouteInfo>? children})
      : super(
          LetInYouRoute.name,
          initialChildren: children,
        );

  static const String name = 'LetInYouRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAppScreen]
class MainAppRoute extends PageRouteInfo<void> {
  const MainAppRoute({List<PageRouteInfo>? children})
      : super(
          MainAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailScreen]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required int movieId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            movieId: movieId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const PageInfo<MovieDetailRouteArgs> page =
      PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    required this.movieId,
    this.key,
  });

  final int movieId;

  final Key? key;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movieId: $movieId, key: $key}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShowAllScreen]
class ShowAllRoute extends PageRouteInfo<ShowAllRouteArgs> {
  ShowAllRoute({
    required ShowAllArgument argument,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ShowAllRoute.name,
          args: ShowAllRouteArgs(
            argument: argument,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowAllRoute';

  static const PageInfo<ShowAllRouteArgs> page =
      PageInfo<ShowAllRouteArgs>(name);
}

class ShowAllRouteArgs {
  const ShowAllRouteArgs({
    required this.argument,
    this.key,
  });

  final ShowAllArgument argument;

  final Key? key;

  @override
  String toString() {
    return 'ShowAllRouteArgs{argument: $argument, key: $key}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
