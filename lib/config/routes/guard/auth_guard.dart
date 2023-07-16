import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/util/providers/firebase_providers.dart';
import '../../../features/auth/data/repositories/auth_repository.dart';
import '../../../features/auth/presentation/controller/auth_controller.dart';
import '../app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref _ref;
  AuthGuard({required Ref ref}) : _ref = ref;

  void modifiState(String uid) async {
    final authRepository = _ref.read(authRepositoryProvider);
    final user = await authRepository.getUserData(uid);

    _ref.watch(userProvider.notifier).update((state) => user);
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = _ref.watch(authProvider).currentUser;

    if (user != null) {
      modifiState(user.uid);
      resolver.next(true);
    } else {
      router.replaceAll([const LoginViewRoute()]);
    }
  }
}
