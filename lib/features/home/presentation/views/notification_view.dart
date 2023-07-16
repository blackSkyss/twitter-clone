import 'package:flutter/material.dart';
import '../../../../config/themes/theme_export.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Notification View',
          style: TextStyle(
            fontSize: 30,
            color: Pallete.whiteColor,
          ),
        ),
      ),
    );
  }
}
