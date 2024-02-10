import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonIcons {
  static SvgPicture getIcon(
    String filename, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      _getPath(filename),
      width: width,
      height: height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
    );
  }

  static String _getPath(String filename) {
    return "assets/icons/$filename";
  }
}
