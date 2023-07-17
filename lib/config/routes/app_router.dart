import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/config/routes/guard/auth_guard.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/explore/presentation/views/explore_view.dart';
import '../../features/home/presentation/views/feed_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/notification_view.dart';
import '../../features/home/presentation/views/search_view.dart';
import '../../features/tweet/presentation/views/create_tweet_view.dart';
import '../../features/tweet/presentation/views/twitter_reply_view.dart';
import '../../models/tweet_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends _$AppRouter {
  final Ref _ref;
  AppRouter({
    required Ref ref,
  }) : _ref = ref;
  @override
  List<AutoRoute> get routes => [
        // routes go here
        AutoRoute(
          initial: true,
          page: HomeViewRoute.page,
          children: [
            AutoRoute(page: FeedViewRoute.page),
            AutoRoute(page: ExploreViewRoute.page),
            AutoRoute(page: NotificationViewRoute.page),
          ],
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(page: LoginViewRoute.page),
        AutoRoute(page: SignUpViewRoute.page),
        AutoRoute(page: CreateTweetViewRoute.page),
        AutoRoute(page: TwitterReplyViewRoute.page),
        AutoRoute(page: ExploreViewRoute.page),
      ];
}

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));
