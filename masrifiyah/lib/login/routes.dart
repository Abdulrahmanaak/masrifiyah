import 'package:flutter/material.dart';
import 'package:masrifiyah/login/ui/support_contact_screen.dart';
import 'package:masrifiyah/login/ui/login.dart';
import './ui/begin.dart';
import 'package:masrifiyah/widgets/navbar.dart';

import 'ui/sign_in.dart';

final Map<String, Widget Function(BuildContext)> loginRoutes = {
  '/': (_) => const BeginScreen(),
  '/register': (_) => const SignInScreen(),
  '/login': (_) => const LoginScreen(),
  '/home': (_) => const NavigationBarApp(),
  '/support': (_) => const SupportContactScreen(),
};
