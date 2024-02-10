import 'package:dakwrite/src/auth/data/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGetUserUseCase {
  final AuthRepository _authRepository;

  AuthGetUserUseCase(this._authRepository);

  User? execute() {
    return _authRepository.getUser();
  }
}
