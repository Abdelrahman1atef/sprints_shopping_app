import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/routes/routes.dart';
import 'package:sprints_shopping_app/core/routes/transition/transition_type.dart';
import 'package:sprints_shopping_app/features/signup_signin/ui/signin_screen.dart';
import 'package:sprints_shopping_app/features/welcome/ui/welcome_screen.dart';
import 'package:sprints_shopping_app/features/home/ui/screens/home_screen.dart';

import '../../features/signup_signin/ui/signup_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(),
        );
      case Routes.signUp:
        return navigateWithAnimation(
          screen: SignupScreen(),
          transition: TransitionType.fade,
        );
      case Routes.signIn:
        return navigateWithAnimation(
          screen: SignInScreen(),
          transition: TransitionType.fade,
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return _undefineRoute();
    }
  }

  static Route<dynamic> _undefineRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          const Scaffold(body: Text("No route found")),
    );
  }
}
