import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masrifiyah/config/routes.dart';
import './config/constant.dart';

void main() {
  runApp(const MyApp());
}

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  static final ThemeNotifier themeNotifier = ThemeNotifier();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return MaterialApp(
          title: 'Masrifiyah',
          theme: lightTheme, // Define the light theme
          darkTheme: darkTheme, // Define the dark theme
          themeMode: themeNotifier.themeMode, // Set the theme mode dynamically
          debugShowCheckedModeBanner: false,
          routes: routes,
          initialRoute: '/', // Use settings screen as home
        );
      },
    );
  }

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
}
