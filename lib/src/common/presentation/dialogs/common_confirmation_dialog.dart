import 'package:dakwrite/src/common/presentation/widgets/common_primary_button.dart';
import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';
class CommonConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String negativeActionText;
  final String positiveActionText;
  final Alignment titleAlignment;
  final Alignment messageAlignment;
  final String iconFileName;
  final Widget? customTitleWidget;
  final Widget? titleIcon;

  const CommonConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.negativeActionText,
    required this.positiveActionText,
    required this.titleAlignment,
    required this.messageAlignment,
    this.iconFileName = '',
    this.customTitleWidget,
    this.titleIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: CommonColors.dustyGray,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          Visibility(
            visible: iconFileName.isNotEmpty,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: CommonIcons.getIcon(
                  iconFileName,
                  height: 124,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                  visible: titleIcon != null,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: titleIcon ?? Container(),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: titleAlignment,
                        child: Visibility(
                          visible: customTitleWidget == null,
                          replacement: customTitleWidget ?? Container(),
                          child: Text(
                            title,
                            maxLines: 3,
                            style: CommonTypography.textHeadlineSmall,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: messageAlignment,
                        child: Text(
                          message,
                          maxLines: 3,
                          style: CommonTypography.textBodySmall,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(top: 24, bottom: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonPrimaryButton(
                    label: negativeActionText,
                    backgroundColor: CommonColors.flushMahogany,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CommonPrimaryButton(
                    label: positiveActionText,
                    backgroundColor: CommonColors.deepCerulean,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
