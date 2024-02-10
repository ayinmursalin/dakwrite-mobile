// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dakwrite/core/data/local/app_preferences.dart' as _i5;
import 'package:dakwrite/core/di/local_module.dart' as _i10;
import 'package:dakwrite/src/auth/data/auth_repository.dart' as _i3;
import 'package:dakwrite/src/auth/data/auth_repository_impl.dart' as _i9;
import 'package:dakwrite/src/auth/di/auth_di_module.dart' as _i8;
import 'package:dakwrite/src/auth/domain/usecases/auth_get_user_usecase.dart'
    as _i6;
import 'package:dakwrite/src/auth/domain/usecases/auth_login_usecase.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final authDiModule = _$AuthDiModule();
    final localModule = _$LocalModule();
    gh.singleton<_i3.AuthRepository>(authDiModule.authRepository);
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.AppPreferences>(
        localModule.appPreferences(gh<_i4.SharedPreferences>()));
    gh.factory<_i6.AuthGetUserUseCase>(
        () => authDiModule.authGetUserUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i7.AuthLoginUseCase>(
        () => authDiModule.authLoginUseCase(gh<_i3.AuthRepository>()));
    return this;
  }
}

class _$AuthDiModule extends _i8.AuthDiModule {
  @override
  _i9.AuthRepositoryImpl get authRepository => _i9.AuthRepositoryImpl();
}

class _$LocalModule extends _i10.LocalModule {}
