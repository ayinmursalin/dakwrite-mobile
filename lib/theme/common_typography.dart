import 'package:dakwrite/theme/common_colors.dart';
import 'package:flutter/material.dart';

class CommonTypography {
  static const fontFamily = 'Poppins';

  static const TextStyle textHeadlineLarge = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.02,
  );
  static const TextStyle textHeadline = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.02,
  );
  static const TextStyle textHeadlineSmall = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.02,
  );

  static const TextStyle textTitleLarge = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static const TextStyle textTitle = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static const TextStyle textTitleSmall = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );

  static const TextStyle textBodyLarge = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );
  static const TextStyle textBody = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );
  static const TextStyle textBodySmall = TextStyle(
    color: CommonColors.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.02,
  );

  static const TextStyle textCaptionLarge = TextStyle(
    color: CommonColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.02,
  );
  static const TextStyle textCaption = TextStyle(
    color: CommonColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.02,
  );
  static const TextStyle textCaptionSmall = TextStyle(
    color: CommonColors.textSecondary,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.02,
  );
}
