import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../models/user_model.dart';
import '../../../../util/commons/functions/common_firebase.dart';
import '../../../auth/data/repositories/auth_repository.dart';

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
}
