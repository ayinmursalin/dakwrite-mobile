import 'package:dakwrite/core/utils/future_util.dart';
import 'package:dakwrite/core/utils/typedef_util.dart';
import 'package:dakwrite/src/auth/data/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends AuthRepository {
  final supabase = Supabase.instance.client;

  @override
  FutureOrError<AuthResponse> login({
    required String email,
    required String password,
  }) {
    return callOrError(() {
      return supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    });
  }

  @override
  User? getUser() {
    return supabase.auth.currentUser;
  }
}
