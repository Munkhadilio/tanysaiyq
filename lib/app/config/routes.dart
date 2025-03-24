import 'package:flutter/material.dart';
import 'package:tanysaiyq/views/auth/login_screen.dart';
import 'package:tanysaiyq/views/auth/sign_up_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/sign-up': (context) => const SignUpScreen()
};
