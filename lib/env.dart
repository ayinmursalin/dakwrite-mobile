import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'DATABASE_PASSWORD')
  static const String databasePassword = _Env.databasePassword;
}
