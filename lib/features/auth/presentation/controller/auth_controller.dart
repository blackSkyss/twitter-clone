import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twitter_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/util/enums/auth_enum.dart';
part 'auth_controller.g.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // Authen (Login, Signup)
  Future<bool> submit({
    required String email,
    required String password,
    required AuthType authType,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final user = await _authenticate(
          email,
          password,
          authType,
        );
        ref.watch(userProvider.notifier).update((state) => user);
      },
    );
    return state.hasError == false;
  }

  Future<UserModel> _authenticate(
    String email,
    String password,
    AuthType formType,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    switch (formType) {
      case AuthType.signin:
        return authRepository.loginUser(email: email, password: password);
      case AuthType.signup:
        return authRepository.signupUser(email: email, password: password);
    }
  }

  // Logout
  Future<void> logout() async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    state = await AsyncValue.guard(
      () async {
        await authRepository.logOut();
        ref.watch(userProvider.notifier).update((state) => null);
      },
    );
  }
}
