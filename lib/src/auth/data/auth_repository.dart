import 'package:dakwrite/core/utils/typedef_util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  FutureOrError<AuthResponse> login({
    required String email,
    required String password,
  });

  User? getUser();
}
