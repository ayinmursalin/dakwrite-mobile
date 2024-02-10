import 'package:dakwrite/core/data/local/app_preferences.dart';
import 'package:dakwrite/core/domain/models/error_dto.dart';
import 'package:dakwrite/core/utils/typedef_util.dart';
import 'package:dakwrite/src/common/presentation/dialogs/common_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ndialog/ndialog.dart';

abstract class CommonBaseState<P extends StatefulWidget> extends State<P> {
  AppPreferences? _appPreferences;
  CustomProgressDialog? _progressDialog;

  @override
  void initState() {
    super.initState();

    _appPreferences = GetIt.instance();
  }

  @override
  void dispose() {
    _progressDialog?.dismiss();
    _progressDialog = null;
    _appPreferences = null;

    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void handleError(
    ErrorDto? error, {
    ErrorTypeCallback? callback,
  }) {
    hideLoadingDialog();

    if (callback != null) {
      callback.call(error?.errorType);
    } else {
      CommonDialogs.showToastMessage(error?.message);
    }
  }

  void showLoadingDialog({
    bool isDismissible = true,
  }) {
    _progressDialog = CustomProgressDialog(
      context,
      dismissable: isDismissible,
    );
    _progressDialog?.setLoadingWidget(const CircularProgressIndicator());

    _progressDialog?.show();
  }

  void hideLoadingDialog() {
    _progressDialog?.dismiss();
  }
}
