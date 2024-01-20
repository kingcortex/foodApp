import 'package:app_cooking/app.dart';
import 'package:app_cooking/screens/auth/sign_in.dart';
import 'package:app_cooking/screens/auth/sign_up.dart';
import 'package:app_cooking/screens/onboarding.dart';
import 'package:flutter/material.dart';

import '../screens/auth/auth_check_page.dart';
import '../screens/search_recipes_page.dart';


Route onGenerateRoute(RouteSettings settings) {
  switch(settings.name) {
    case AppRoute.authCheck:
      return MaterialPageRoute(builder: (context) => const AuthCheckPage());
    case AppRoute.onboarding:
      return MaterialPageRoute(builder:(context) => const Onboarding(),);
    case AppRoute.signIn:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case AppRoute.signUp:
      return MaterialPageRoute(builder: (context) => const SignUpPage());
    case AppRoute.app:
      return MaterialPageRoute(builder: (context) => const App());
    case AppRoute.search:
      return MaterialPageRoute(builder: (context) => const SearchRecipesPages());
    default :
      return MaterialPageRoute(builder:(context) => const AuthCheckPage(),);
  }
}


class AppRoute {
  static const String authCheck = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/singIn';
  static const String signUp = '/singUp';
  static const String app = "/app";
  static const String search = '/search';
}

