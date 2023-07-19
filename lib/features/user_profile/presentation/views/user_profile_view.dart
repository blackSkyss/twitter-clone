import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../widgets/user_profile.dart';
import '../../../../models/user_model.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';

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
