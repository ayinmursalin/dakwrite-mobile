import 'package:dakwrite/app_supabase.dart';
import 'package:dakwrite/core/utils/date_time_util.dart';
import 'package:dakwrite/di.dart';
import 'package:dakwrite/my_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting(DateTimeUtil.locale, null);
  await AppSupabase.init();
  await configureDependencies();

  runApp(const MyApp());
}
