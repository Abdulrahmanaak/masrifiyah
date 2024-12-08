import 'package:flutter/material.dart';
import 'package:masrifiyah/login/ui/SupportContactScreen.dart';
import './ui/begin.dart';
import 'package:masrifiyah/widgets/navbar.dart';

final Map<String, Widget Function(BuildContext)> loginRoutes = {
  '/': (_) => const NavigationBarApp(),
  '/register': (_) =>
      const Scaffold(body: Center(child: Text('Register Screen'))),
  '/login': (_) => const Scaffold(body: Center(child: Text('Login Screen'))),
  '/support': (_) => const SupportContactScreen(), // New route
};