
import 'package:dakwrite/src/auth/presentation/login/auth_login_page.dart';
import 'package:dakwrite/src/main/presentation/main_page.dart';
import 'package:dakwrite/theme/color_schemes.g.dart';
import 'package:dakwrite/theme/common_typography.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dakwrite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        fontFamily: CommonTypography.fontFamily,
        useMaterial3: false,
      ),
      initialRoute: MainPage.route,
      routes: {
        MainPage.route: (_) => const MainPage(),
        AuthLoginPage.route: (_) => const AuthLoginPage(),
      },
    );
  }
}
