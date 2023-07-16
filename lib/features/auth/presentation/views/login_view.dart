// ignore_for_file: use_build_context_synchronously
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twitter_clone/config/routes/app_router.dart';
import 'package:twitter_clone/config/themes/pallete.dart';
import 'package:twitter_clone/features/auth/presentation/controller/auth_controller.dart';
import 'package:twitter_clone/util/constants/constants_export.dart';
import 'package:twitter_clone/util/enums/auth_enum.dart';
import 'package:twitter_clone/util/extensions/async_value_ui.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../widgets/auth_field.dart';

@RoutePage()
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  void _submit(
    WidgetRef ref,
    BuildContext context,
    String email,
    String password,
  ) async {
    final res = await ref.read(authControllerProvider.notifier).submit(
          email: email,
          password: password,
          authType: AuthType.signin,
        );
    if (res) {
      context.router.replaceAll([const HomeViewRoute()]);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final state = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: UIConstants.appBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 25),
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: 40),
                state.isLoading
                    ? const Loader()
                    : Align(
                        alignment: Alignment.topRight,
                        child: RoundedSmallButton(
                          onTap: () => _submit(
                            ref,
                            context,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          ),
                          label: 'Done',
                        ),
                      ),
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: "Dont't have an account?  ",
                    style: const TextStyle(fontSize: 17),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => state.isLoading
                              ? null
                              : context.pushRoute(const SignUpViewRoute()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
