import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/routes/app_routes.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: AppRoutes.SPLASH,
      routes: {
        AppRoutes.SPLASH: (context) => SplashPage(),
        AppRoutes.HOME: (context) => HomePage(),
        AppRoutes.LOGIN: (context) => LoginPage(),
      },
    );
  }
}
