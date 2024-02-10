import 'package:dakwrite/src/auth/data/auth_repository.dart';
import 'package:dakwrite/src/auth/data/auth_repository_impl.dart';
import 'package:dakwrite/src/auth/domain/usecases/auth_get_user_usecase.dart';
import 'package:dakwrite/src/auth/domain/usecases/auth_login_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthDiModule {
  @Singleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @injectable
  AuthLoginUseCase authLoginUseCase(AuthRepository repository) =>
      AuthLoginUseCase(repository);

  @injectable
  AuthGetUserUseCase authGetUserUseCase(AuthRepository repository) =>
      AuthGetUserUseCase(repository);
}
