import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
class Env {
  @EnviedField(varName: 'SUPABASE_URL')
  static const String url = _Env.url;
  @EnviedField(varName: 'SUPABASE_KEY')
  static const String apiKey = _Env.apiKey;
  @EnviedField(varName: 'SUPABASE_DATABASE_PASSWORD')
  static const String databasePassword = _Env.databasePassword;
}
