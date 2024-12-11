import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access the theme's text styles

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface, // AppBar background color
        elevation: 0,
        title: Text(
          "سياسة الخصوصية",
          style: textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface, // Title color
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface, // Back button color
        ),
      ),
      backgroundColor: theme.colorScheme.surface, // Screen background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl, // Right-to-left text alignment
          child: ListView(
            children: [
              Text(
                "مرحبًا بك في سياسة الخصوصية الخاصة بنا!",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "نحن ملتزمون بحماية خصوصيتك وضمان أمان بياناتك. من خلال استخدامك لتطبيقنا، فإنك توافق على جمع واستخدام المعلومات وفقًا لهذه السياسة.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "1. المعلومات التي نجمعها:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "نقوم بجمع المعلومات التي تقدمها مباشرةً عند التسجيل أو استخدام التطبيق، بما في ذلك الاسم، البريد الإلكتروني، ورقم الهاتف.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "2. كيف نستخدم معلوماتك:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "نستخدم المعلومات لتقديم الخدمات، تحسين تجربة المستخدم، وإرسال الإشعارات المهمة.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "3. حماية المعلومات:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "نتخذ التدابير الأمنية اللازمة لحماية بياناتك من الوصول غير المصرح به أو التغيير أو الإفشاء.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "4. التغييرات على السياسة:",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "نحتفظ بالحق في تحديث هذه السياسة في أي وقت. سيتم إخطار المستخدمين بالتغييرات الرئيسية.",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurface, // Dynamic color
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "إذا كان لديك أي استفسارات حول سياسة الخصوصية، يُرجى التواصل مع فريق الدعم.",
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
