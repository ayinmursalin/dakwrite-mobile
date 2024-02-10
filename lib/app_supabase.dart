import 'package:dakwrite/core/data/local/app_storage.dart';
import 'package:dakwrite/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabase {
  static Future init() async {
    await Supabase.initialize(
      url: Env.url,
      anonKey: Env.apiKey,
      authOptions: const FlutterAuthClientOptions(
        localStorage: AppStorage(),
      ),
    );
  }
}
