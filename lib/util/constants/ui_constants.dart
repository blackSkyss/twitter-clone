import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants_export.dart';
import '../../config/themes/theme_export.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
