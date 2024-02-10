import 'package:dakwrite/core/utils/typedef_util.dart';
import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:flutter/material.dart';

class CommonPasswordToggle extends StatefulWidget {
  final bool hasFocus;
  final BooleanCallback? onPasswordPressed;

  const CommonPasswordToggle({
    super.key,
    required this.hasFocus,
    this.onPasswordPressed,
  });

  @override
  State<CommonPasswordToggle> createState() => _CommonPasswordToggleState();
}

class _CommonPasswordToggleState extends State<CommonPasswordToggle> {
  var _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _togglePasswordVisibility,
      splashRadius: 24,
      icon: _isPasswordVisible
          ? CommonIcons.getIcon(
              'ic_pass_hide.svg',
              height: 20,
              color: widget.hasFocus
                  ? CommonColors.black
                  : CommonColors.sirocco,
            )
          : CommonIcons.getIcon(
              'ic_pass_visible.svg',
              height: 20,
              color: widget.hasFocus
                  ? CommonColors.black
                  : CommonColors.sirocco,
            ),
    );
  }

  void _togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    widget.onPasswordPressed?.call(_isPasswordVisible);
  }
}
