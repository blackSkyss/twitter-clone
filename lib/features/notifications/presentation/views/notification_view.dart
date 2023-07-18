import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/features/notifications/data/repositories/notification_repository.dart';
import 'package:twitter_clone/util/commons/widgets/widget_common_export.dart';

import '../widgets/notification_tile.dart';

@RoutePage()
class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(getUserDataProvider('')).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: currentUser == null
          ? const Loader()
          : ref.watch(getLastestNotificationProvider(currentUser.uid)).when(
                data: (notifications) {
                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return NotificationTile(
                        notification: notification,
                      );
                    },
                  );
                },
                error: (err, trace) => ErrorText(error: err.toString()),
                loading: () => const Loader(),
              ),
    );
  }
}
