import 'package:flutter/material.dart';
import 'package:masrifiyah/pages/calculator_screen.dart'; // Assuming LoanCalculatorPage is in this file
import 'package:masrifiyah/pages/banks_screen.dart';
import 'package:masrifiyah/pages/home_screen.dart';
import 'package:masrifiyah/pages/settings/settings_screen.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _currentIndex = 0;

  // List of pages for the bottom navigation bar
  final List<Widget> _pages = [
    const HomeScreen(),
    const BanksScreen(),
    LoanCalculatorPage(), // Replaced AnalyticsScreen with LoanCalculatorPage
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access current theme

    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.colorScheme.surface, // Dynamic background color
        elevation: 8, // Add slight elevation for a clean look
        selectedItemColor: theme.colorScheme.primary, // Dynamic highlight color
        unselectedItemColor:
            theme.colorScheme.onSurfaceVariant, // Dynamic unselected color
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary, // Dynamic label color
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: theme.colorScheme.onSurfaceVariant, // Dynamic label color
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'البنوك',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate), // Updated icon for calculator
            label: 'الحاسبة', // Updated label to reflect Loan Calculator
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}
