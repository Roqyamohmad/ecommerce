import 'package:Ecommerce/features/auth/presentation/views/signin_view.dart';
import 'package:Ecommerce/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import '../../features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
