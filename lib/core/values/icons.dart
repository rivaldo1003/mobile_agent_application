import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static SvgPicture svg(
    String icon, {
    Color? color,
    ColorFilter? colorFilter,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : colorFilter,
      width: width,
      height: height,
    );
  }
}
