import 'package:flutter/material.dart';
import 'package:masrifiyah/config/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masrifiyah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
    );
  }
}
