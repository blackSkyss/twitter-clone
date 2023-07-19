import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../config/routes/app_router.dart';
import '../../../../util/extensions/async_value_ui.dart';
import '../../../../util/extensions/string_hardcoded.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/auth_enum.dart';
import '../controller/auth_controller.dart';
import '../widgets/auth_field.dart';

@RoutePage()
class SignUpView extends HookConsumerWidget {
  const SignUpView({super.key});

  void _submit(
    WidgetRef ref,
    BuildContext context,
    String email,
    String password,
  ) async {
    final res = await ref.read(authControllerProvider.notifier).submit(
          email: email,
          password: password,
          authType: AuthType.signup,
        );
    if (res) {
      if (context.mounted) {
        showSnackBar(
            context: context, content: 'Create account successfully'.hardcoded);
        context.router.replaceAll([const LoginViewRoute()]);
      }
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
                    text: "Already have an account  ",
                    style: const TextStyle(fontSize: 17),
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => state.isLoading
                              ? null
                              : context.pushRoute(const LoginViewRoute()),
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
