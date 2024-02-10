import 'package:dakwrite/core/domain/models/state_wrapper.dart';
import 'package:dakwrite/src/auth/domain/usecases/auth_login_usecase.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLoginController extends GetxController {
  final AuthLoginUseCase authLoginUseCase;

  final loginState = const StateWrapper<AuthResponse>(isLoading: true).obs;

  AuthLoginController({
    required this.authLoginUseCase,
  });

  Future<void> onLogin({
    required String email,
    required String password,
  }) async {
    loginState.value = loginState.value.copyWith(isLoading: true);

    final result = await authLoginUseCase.execute(
      email: email,
      password: password,
    );

    result.fold((error) {
      loginState.value = loginState.value.copyWith(
        isLoading: false,
        error: error,
        data: null,
      );
    }, (response) {
      loginState.value = loginState.value.copyWith(
        isLoading: false,
        error: null,
        data: response,
      );
    });
  }
}
