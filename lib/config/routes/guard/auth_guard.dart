import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../util/providers/firebase_providers.dart';
import '../app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref _ref;
  AuthGuard({required Ref ref}) : _ref = ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = _ref.watch(authProvider).currentUser;

    if (user != null) {
      resolver.next();
    } else {
      router.replaceAll([const LoginViewRoute()]);
    }
  }
}
