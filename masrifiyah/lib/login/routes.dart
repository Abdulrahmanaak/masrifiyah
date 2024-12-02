import 'package:flutter/material.dart';
import './ui/begin.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const BeginScreen());
      case '/register':
        // TODO: Implement RegisterScreen
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Register Screen'))));
      case '/login':
        // TODO: Implement LoginScreen
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Login Screen'))));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}