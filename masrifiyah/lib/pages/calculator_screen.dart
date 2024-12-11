import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      backgroundColor: theme.colorScheme.surface, // Use theme background color
      body: Center(
        child: Text(
          'شاشة التحليلات',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface, // Text color based on theme
          ),
        ),
      ),
    );
  }
}
