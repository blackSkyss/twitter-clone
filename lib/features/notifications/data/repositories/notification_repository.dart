import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_clone/models/notification_model.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/providers/firebase_providers.dart';

part 'notification_repository.g.dart';

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  final firestore = ref.read(firestoreProvider);
  return NotificationRepository(
    firestore: firestore,
  );
}

@riverpod
Stream<List<Notification>> getLastestNotification(
    GetLastestNotificationRef ref, String uid) {
  final notificationRepository = ref.read(notificationRepositoryProvider);
  return notificationRepository.getLastestNotification(uid);
}

class NotificationRepository {
  final FirebaseFirestore _firestore;
  NotificationRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _notifications =>
      _firestore.collection(FirebaseConstants.notificationCollection);

  // Create notification
  Future<void> createNotification(Notification notification) async {
    return await _notifications.doc(notification.id).set(notification.toMap());
  }

  // Get lastest notification
  Stream<List<Notification>> getLastestNotification(String uid) {
    return _notifications.where('uid', isEqualTo: uid).snapshots().map((event) {
      List<Notification> notifications = [];

      for (var document in event.docs) {
        notifications
            .add(Notification.fromMap(document.data() as Map<String, dynamic>));
      }
      return notifications;
    });
  }
}
