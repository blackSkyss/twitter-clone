import 'package:flutter/material.dart';
import '../../../../config/themes/theme_export.dart';

class LabelText extends StatelessWidget {
  final String content;
  const LabelText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        color: Pallete.backgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
