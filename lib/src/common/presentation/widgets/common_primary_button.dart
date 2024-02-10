import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';

class CommonPrimaryButton extends StatelessWidget {
  final String label;
  final String iconFileName;
  final EdgeInsets margin;
  final Color color;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;
  final VoidCallback? onPressed;

  const CommonPrimaryButton({
    super.key,
    required this.label,
    this.iconFileName = '',
    this.margin = EdgeInsets.zero,
    this.color = CommonColors.white,
    this.backgroundColor = CommonColors.deepCerulean,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.borderRadius = 8,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconFileName.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CommonIcons.getIcon(
                  iconFileName,
                  height: 20,
                  color: color,
                ),
              ),
            ),
            Text(
              label,
              style: CommonTypography.textTitleSmall.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
