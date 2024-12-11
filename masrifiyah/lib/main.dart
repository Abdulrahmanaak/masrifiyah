import 'package:flutter/material.dart';
import 'package:masrifiyah/config/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import './config/constant.dart'; // Import the constants.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define light and dark themes
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.ibmPlexSansArabicTextTheme().apply(
          bodyColor: AppColors.textColor,
          displayColor: AppColors.textColor,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          disabledColor: AppColors.disabledColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ).copyWith(surface: AppColors.backgroundColor),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimaryColor,
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        textTheme: GoogleFonts.ibmPlexSansArabicTextTheme().apply(
          bodyColor: AppColors.darkTextColor,
          displayColor: AppColors.darkTextColor,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.darkPrimaryColor,
          disabledColor: AppColors.darkDisabledColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkPrimaryColor,
            foregroundColor: AppColors.darkTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkPrimaryColor,
          brightness: Brightness.dark,
        ).copyWith(surface: AppColors.darkBackgroundColor),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masrifiyah',
      theme: lightTheme, // Use the defined light theme
      darkTheme: darkTheme, // Use the defined dark theme
      themeMode: ThemeMode.system, // Use system theme mode (light/dark)
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
    );
  }
}
