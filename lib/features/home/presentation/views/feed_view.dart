import 'package:flutter/material.dart';
import 'package:twitter_clone/config/themes/theme_export.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Feed View',
          style: TextStyle(
            fontSize: 30,
            color: Pallete.whiteColor,
          ),
        ),
      ),
    );
  }
}
