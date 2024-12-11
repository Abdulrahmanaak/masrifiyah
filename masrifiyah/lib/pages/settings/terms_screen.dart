import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access the theme's text styles

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface, // AppBar background color
        elevation: 0,
        title: Text(
          "الشروط والأحكام",
          style: textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface, // Title color
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface, // Back button color
        ),
      ),
      backgroundColor: theme.colorScheme.surface, // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl, // Right-to-left text alignment
          child: ListView(
            children: [
              Text(
                "مرحبًا بك في تطبيقنا!",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "يرجى قراءة الشروط والأحكام بعناية قبل استخدام التطبيق. باستخدامك للتطبيق، فإنك توافق على الالتزام بالشروط التالية:",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "1. استخدام التطبيق:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "يجب استخدام التطبيق فقط للأغراض القانونية والمصرح بها. يُحظر أي استخدام غير قانوني أو ضار.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "2. حقوق الملكية:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "جميع المحتويات والمواد الموجودة في التطبيق محمية بموجب حقوق النشر وحقوق الملكية الفكرية.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "3. التغييرات في الشروط:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إخطار المستخدمين بالتغييرات عبر التطبيق.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "4. المسؤوليات:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "المستخدم مسؤول عن الحفاظ على أمان حسابه وكلمة المرور الخاصة به. نحن غير مسؤولين عن أي استخدام غير مصرح به لحسابك.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "إذا كان لديك أي استفسارات حول الشروط والأحكام، يُرجى التواصل مع فريق الدعم.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
