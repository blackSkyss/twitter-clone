import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:uni_links/uni_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'config/routes/app_router.dart';
import 'config/themes/theme_export.dart';
import 'firebase_options.dart';
import 'util/enums/enums_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const ProviderScope(
        child: MyApp(),
      )));
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StreamSubscription? sub;

    Future<void> initUniLinks() async {
      // ... check initialLink

      // Attach a listener to the stream
      sub = linkStream.listen((String? link) {
        // Parse the link and warn the user, if it is not correct
        if (link != null) {
          print('vao duoc day roif');
          var uri = Uri.parse(link);
          if (uri.queryParameters['amount'] != null &&
              uri.queryParameters['resultCode'] != null) {
            if (int.parse(uri.queryParameters['resultCode'] as String) ==
                9000) {
              context.router.push(
                PaymentResultViewRoute(
                  status: PaymentStatusType.success,
                  title: 'SUCCESSFULLY',
                  message: 'Order has been successfully paid',
                  amount: uri.queryParameters['amount'] as String,
                ),
              );
            }
          }
        }
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
      });

      // NOTE: Don't forget to call _sub.cancel() in dispose()
    }

    useEffect(() {
      initUniLinks();
      return () async {
        await sub?.cancel();
      };
    }, const []);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      routerConfig: ref.watch(appRouterProvider).config(),
    );
  }
}
