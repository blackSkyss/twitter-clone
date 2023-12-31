import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../features/payment/presentation/views/payment_result_view.dart';
import '../../features/payment/presentation/views/payment_view.dart';
import '../../util/enums/payment_status_enum.dart';
import 'guard/auth_guard.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/explore/presentation/views/explore_view.dart';
import '../../features/home/presentation/views/feed_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/notifications/presentation/views/notification_view.dart';
import '../../features/tweet/presentation/views/create_tweet_view.dart';
import '../../features/tweet/presentation/views/hashtag_view.dart';
import '../../features/tweet/presentation/views/twitter_reply_view.dart';
import '../../features/user_profile/presentation/views/edit_profile_view.dart';
import '../../features/user_profile/presentation/views/user_profile_view.dart';
import '../../models/tweet_model.dart';
import '../../models/user_model.dart';

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
        AutoRoute(
          page: CreateTweetViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: TwitterReplyViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: ExploreViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: UserProfileViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: EditProfileViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: HashtagViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: PaymentViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
        AutoRoute(
          page: PaymentResultViewRoute.page,
          guards: [AuthGuard(ref: _ref)],
        ),
      ];
}

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));
