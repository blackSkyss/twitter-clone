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
    LoginViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    SignUpViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
    FeedViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    NotificationViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationView(),
      );
    },
    SearchViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    CreateTweetViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateTweetView(),
      );
    },
  };
}

/// generated route for
/// [LoginView]
class LoginViewRoute extends PageRouteInfo<void> {
  const LoginViewRoute({List<PageRouteInfo>? children})
      : super(
          LoginViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpView]
class SignUpViewRoute extends PageRouteInfo<void> {
  const SignUpViewRoute({List<PageRouteInfo>? children})
      : super(
          SignUpViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedView]
class FeedViewRoute extends PageRouteInfo<void> {
  const FeedViewRoute({List<PageRouteInfo>? children})
      : super(
          FeedViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute({List<PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationView]
class NotificationViewRoute extends PageRouteInfo<void> {
  const NotificationViewRoute({List<PageRouteInfo>? children})
      : super(
          NotificationViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchView]
class SearchViewRoute extends PageRouteInfo<void> {
  const SearchViewRoute({List<PageRouteInfo>? children})
      : super(
          SearchViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateTweetView]
class CreateTweetViewRoute extends PageRouteInfo<void> {
  const CreateTweetViewRoute({List<PageRouteInfo>? children})
      : super(
          CreateTweetViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTweetViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
