import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/config/routes/app_router.dart';
import 'package:twitter_clone/config/themes/pallete.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/auth/presentation/controller/auth_controller.dart';
import 'package:twitter_clone/features/user_profile/presentation/controller/user_profile_controller.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(getUserDataProvider('')).value;

    if (currentUser == null) {
      return const Loader();
    }
    return SafeArea(
      child: Drawer(
        backgroundColor: Pallete.backgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              onTap: () {
                context.router.push(UserProfileViewRoute(user: currentUser));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.payment,
                size: 30,
              ),
              title: const Text(
                'Twitter Blue',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              onTap: () {
                ref.read(userProfileControllerProvider.notifier).updateUserData(
                      userModel: currentUser.copyWith(isTwitterBlue: true),
                      bannerFile: null,
                      profileFile: null,
                    );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                size: 30,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              onTap: () async {
                await ref.read(authControllerProvider.notifier).logout();
                if (context.mounted) {
                  context.router.replaceAll([const LoginViewRoute()]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
