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
    ExploreViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExploreView(),
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
    TwitterReplyViewRoute.name: (routeData) {
      final args = routeData.argsAs<TwitterReplyViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TwitterReplyView(
          key: args.key,
          tweet: args.tweet,
        ),
      );
    },
    EditProfileViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileView(),
      );
    },
    UserProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserProfileView(
          key: args.key,
          user: args.user,
        ),
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
/// [ExploreView]
class ExploreViewRoute extends PageRouteInfo<void> {
  const ExploreViewRoute({List<PageRouteInfo>? children})
      : super(
          ExploreViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreViewRoute';

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

/// generated route for
/// [TwitterReplyView]
class TwitterReplyViewRoute extends PageRouteInfo<TwitterReplyViewRouteArgs> {
  TwitterReplyViewRoute({
    Key? key,
    required Tweet tweet,
    List<PageRouteInfo>? children,
  }) : super(
          TwitterReplyViewRoute.name,
          args: TwitterReplyViewRouteArgs(
            key: key,
            tweet: tweet,
          ),
          initialChildren: children,
        );

  static const String name = 'TwitterReplyViewRoute';

  static const PageInfo<TwitterReplyViewRouteArgs> page =
      PageInfo<TwitterReplyViewRouteArgs>(name);
}

class TwitterReplyViewRouteArgs {
  const TwitterReplyViewRouteArgs({
    this.key,
    required this.tweet,
  });

  final Key? key;

  final Tweet tweet;

  @override
  String toString() {
    return 'TwitterReplyViewRouteArgs{key: $key, tweet: $tweet}';
  }
}

/// generated route for
/// [EditProfileView]
class EditProfileViewRoute extends PageRouteInfo<void> {
  const EditProfileViewRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserProfileView]
class UserProfileViewRoute extends PageRouteInfo<UserProfileViewRouteArgs> {
  UserProfileViewRoute({
    Key? key,
    required UserModel user,
    List<PageRouteInfo>? children,
  }) : super(
          UserProfileViewRoute.name,
          args: UserProfileViewRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'UserProfileViewRoute';

  static const PageInfo<UserProfileViewRouteArgs> page =
      PageInfo<UserProfileViewRouteArgs>(name);
}

class UserProfileViewRouteArgs {
  const UserProfileViewRouteArgs({
    this.key,
    required this.user,
  });

  final Key? key;

  final UserModel user;

  @override
  String toString() {
    return 'UserProfileViewRouteArgs{key: $key, user: $user}';
  }
}
