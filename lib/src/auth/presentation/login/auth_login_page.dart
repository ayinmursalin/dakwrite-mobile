import 'dart:async';

import 'package:dakwrite/src/auth/presentation/login/auth_login_controller.dart';
import 'package:dakwrite/src/common/presentation/dialogs/common_dialogs.dart';
import 'package:dakwrite/src/common/presentation/widgets/common_base_state.dart';
import 'package:dakwrite/src/common/presentation/widgets/common_password_toggle.dart';
import 'package:dakwrite/src/common/presentation/widgets/common_primary_button.dart';
import 'package:dakwrite/src/common/presentation/widgets/common_text_field.dart';
import 'package:dakwrite/theme/common_colors.dart';
import 'package:dakwrite/theme/common_icons.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AuthLoginPage extends StatefulWidget {
  static const route = '/auth/login';

  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends CommonBaseState<AuthLoginPage> {
  final _inputFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();

  late AuthLoginController _controller;

  var _isPasswordVisible = false;
  var _isFocusPassword = false;

  StreamSubscription? _loginState;

  @override
  void initState() {
    super.initState();

    _controller = AuthLoginController(
      authLoginUseCase: GetIt.instance(),
    );

    _setupFocusNode();
    _subscribeLoginState();
  }

  void _setupFocusNode() {
    _passwordFocus.addListener(() {
      setState(() {
        _isFocusPassword = _passwordFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _loginState?.cancel();
    _loginState = null;
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommonColors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: Navigator.of(context).pop,
            splashRadius: 24,
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: CommonColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _inputFormKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              CommonTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'Masukkan Email',
                prefixIcon: CommonIcons.getIcon(
                  'ic_user_safe.svg',
                  height: 24,
                  width: 24,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validators: const [
                  CommonTextFieldValidator.noEmpty,
                  CommonTextFieldValidator.email,
                ],
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                label: 'Password',
                hint: 'Masukkan Password',
                prefixIcon: CommonIcons.getIcon(
                  'ic_password.svg',
                  height: 22,
                  width: 22,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !_isPasswordVisible,
                suffixIcon: CommonPasswordToggle(
                  hasFocus: _isFocusPassword,
                  onPasswordPressed: _togglePasswordVisibility,
                ),
                validators: const [
                  CommonTextFieldValidator.noEmpty,
                  CommonTextFieldValidator.min5Characters,
                ],
              ),
              const SizedBox(height: 64),
              CommonPrimaryButton(
                label: 'Login',
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 12),
                borderRadius: 120,
                onPressed: _onLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility(bool isVisible) {
    setState(() {
      _isPasswordVisible = isVisible;
    });
  }

  /// Subscribe data
  void _subscribeLoginState() {
    _loginState = _controller.loginState.listen((state) {
      if (state.isLoading) {
        showLoadingDialog();
        return;
      }

      hideLoadingDialog();
      if (state.error != null) {
        handleError(state.error);
        return;
      }

      if (state.data?.session == null) {
        CommonDialogs.showToastMessage(
          'Account is not active, please check your email to confirm activation',
        );
        return;
      }

      CommonDialogs.showToastMessage('Login Success');
      Navigator.of(context).pop();
    });
  }

  void _onLogin() async {
    if (_inputFormKey.currentState?.validate() == true) {
      final email = _emailController.text;
      final password = _passwordController.text;

      await _controller.onLogin(
        email: email,
        password: password,
      );
    }
  }
}
