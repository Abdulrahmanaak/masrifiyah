import 'package:flutter/material.dart';

class SupportContactScreen extends StatelessWidget {
  const SupportContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تواصل مع الدعم',
          style: textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onPrimary, // AppBar title color
          ),
        ),
        backgroundColor: theme.colorScheme.primary, // Use theme primary color
        iconTheme: IconThemeData(
          color: theme.colorScheme.onPrimary, // Back button color
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'للتواصل مع الدعم الفني، يرجى مراسلتنا على البريد الإلكتروني:',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Text color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'support@example.com',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary, // Primary color
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'أو اتصل بنا على الرقم:',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Text color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '+123-456-7890',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary, // Primary color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
