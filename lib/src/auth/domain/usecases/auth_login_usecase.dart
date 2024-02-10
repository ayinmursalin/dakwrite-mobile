import 'package:dakwrite/core/utils/typedef_util.dart';
import 'package:dakwrite/src/auth/data/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLoginUseCase {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  FutureOrError<AuthResponse> execute({
    required String email,
    required String password,
  }) {
    return _authRepository.login(email: email, password: password);
  }
}
