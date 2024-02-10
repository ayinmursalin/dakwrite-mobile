import 'package:dakwrite/src/common/presentation/dialogs/common_confirmation_dialog.dart';
import 'package:dakwrite/src/common/presentation/dialogs/common_message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonDialogs {
  static Future showConfirmationDialog(BuildContext context, {
    String title = 'Title',
    String message = 'Success',
    String negativeActionText = 'Batalkan',
    String positiveActionText = 'Continue',
    Alignment titleAlignment = Alignment.center,
    Alignment messageAlignment = Alignment.center,
    String iconFileName = '',
    Widget? customTitleWidget,
    Widget? titleIcon,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return CommonConfirmationDialog(
          title: title,
          message: message,
          negativeActionText: negativeActionText,
          positiveActionText: positiveActionText,
          titleAlignment: titleAlignment,
          messageAlignment: messageAlignment,
          iconFileName: iconFileName,
          customTitleWidget: customTitleWidget,
          titleIcon: titleIcon,
        );
      },
    );
  }

  static Future showMessageDialog(BuildContext context, {
    String title = 'Title',
    String message = 'Success',
    String actionText = 'Ok',
    Alignment titleAlignment = Alignment.center,
    Alignment messageAlignment = Alignment.center,
    String iconFileName = '',
    Widget? customTitleWidget,
    Widget? titleIcon,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return CommonMessageDialog(
          title: title,
          message: message,
          actionText: actionText,
          titleAlignment: titleAlignment,
          messageAlignment: messageAlignment,
          iconFileName: iconFileName,
          customTitleWidget: customTitleWidget,
          titleIcon: titleIcon,
        );
      },
    );
  }

  static void showToastMessage(String? message) {
    Fluttertoast.showToast(
      msg: message ?? '',
      backgroundColor: Colors.black.withOpacity(0.65),
    );
  }
}
