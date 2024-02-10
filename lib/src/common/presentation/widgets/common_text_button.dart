import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final String label;
  final String iconFileName;
  final EdgeInsets padding;
  final Color color;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  const CommonTextButton({
    super.key,
    required this.label,
    this.iconFileName = '',
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.color = CommonColors.textPrimary,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: iconFileName.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(right: 6),
                child: CommonIcons.getIcon(
                  iconFileName,
                  width: 20,
                ),
              ),
            ),
            Text(
              label,
              style: textStyle ?? CommonTypography.textTitleSmall.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
