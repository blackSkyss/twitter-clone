import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../models/user_model.dart';
import '../../../../util/commons/functions/common_firebase.dart';
import '../../../../util/enums/notification_type_enum.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../notifications/presentation/controller/notification_controller.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // Update user data
  Future<void> updateUserData({
    required UserModel userModel,
    required File? bannerFile,
    required File? profileFile,
  }) async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final commonFirebase = ref.read(commonFirebaseStorageRepositoryProvider);

    if (bannerFile != null) {
      final bannerUrl = await commonFirebase.storeFileToFirebase(
        'user/${userModel.uid}/bannerFile',
        [bannerFile],
      );

      userModel = userModel.copyWith(
        bannerPic: bannerUrl[0],
      );
    }

    if (profileFile != null) {
      final profileUrl = await commonFirebase.storeFileToFirebase(
        'user/${userModel.uid}/profileFile',
        [profileFile],
      );

      userModel = userModel.copyWith(
        profilePic: profileUrl[0],
      );
    }

    state = await AsyncValue.guard(
      () async {
        await authRepository.updateUserData(userModel);
      },
    );
  }

  // Follow user
  void followUser({
    required UserModel user,
    required UserModel currentUser,
  }) async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final notificationController =
        ref.read(notificationControllerProvider.notifier);

    if (currentUser.following.contains(user.uid)) {
      user.followers.remove(currentUser.uid);
      currentUser.following.remove(user.uid);
    } else {
      user.followers.add(currentUser.uid);
      currentUser.following.add(user.uid);
    }

    user = user.copyWith(followers: user.followers);
    currentUser = currentUser.copyWith(following: currentUser.following);

    state = await AsyncValue.guard(
      () async {
        await authRepository.followUser(user);
        await authRepository.addToFollowing(currentUser);
        if (currentUser.following.contains(user.uid)) {
          notificationController.createNotification(
            text: '${currentUser.name} followed you',
            postId: '',
            notificationType: NotificationType.follow,
            uid: user.uid,
          );
        }
      },
    );
  }
}
