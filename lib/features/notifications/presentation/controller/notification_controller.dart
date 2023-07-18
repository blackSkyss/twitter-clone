import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_clone/features/notifications/data/repositories/notification_repository.dart';
import 'package:twitter_clone/models/notification_model.dart';
import 'package:twitter_clone/util/enums/notification_type_enum.dart';
import 'package:uuid/uuid.dart';
part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // Create notification
  void createNotification({
    required String text,
    required String postId,
    required NotificationType notificationType,
    required String uid,
  }) async {
    state = const AsyncValue.loading();
    final notificationRepository = ref.read(notificationRepositoryProvider);

    final id = const Uuid().v1();
    final notification = Notification(
      text: text,
      postId: postId,
      id: id,
      uid: uid,
      notificationType: notificationType,
    );
    state = await AsyncValue.guard(
      () async {
        await notificationRepository.createNotification(notification);
      },
    );
  }
}
