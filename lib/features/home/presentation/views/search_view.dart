import 'package:flutter/material.dart';
import '../../../../config/themes/theme_export.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Search View',
          style: TextStyle(
            fontSize: 30,
            color: Pallete.whiteColor,
          ),
        ),
      ),
    );
  }
}
