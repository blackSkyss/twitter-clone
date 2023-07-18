import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/user_profile/presentation/widgets/user_profile.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';

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
      body: ref.watch(getLastestUserProfileDataProvider(user.uid)).when(
            data: (data) {
              if (data != null) {
                return UserProfile(user: data);
              }
              return const Center(
                child: ErrorText(error: 'Something wrong!'),
              );
            },
            error: (err, trace) => ErrorText(error: err.toString()),
            loading: () => const Loader(),
          ),
    );
  }
}
