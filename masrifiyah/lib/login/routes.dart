import 'package:flutter/material.dart';
import './ui/begin.dart';

final Map<String, Widget Function(BuildContext)> loginRoutes = {
  '/': (_) => const BeginScreen(),
  '/register': (_) =>
      const Scaffold(body: Center(child: Text('Register Screen'))),
  '/login': (_) => const Scaffold(body: Center(child: Text('Login Screen'))),
};
