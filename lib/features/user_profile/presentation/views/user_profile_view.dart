import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/user_profile/presentation/widgets/user_profile.dart';

import 'package:twitter_clone/models/user_model.dart';

@RoutePage()
class UserProfileView extends ConsumerWidget {
  final UserModel user;
  const UserProfileView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: UserProfile(user: user),
    );
  }
}
