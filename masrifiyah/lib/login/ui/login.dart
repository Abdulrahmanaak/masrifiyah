import 'package:flutter/material.dart';
import 'sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hasTriedToSubmit = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access the theme's text styles

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'مرحبًا بكم',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary, // Primary color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                CustomTextFormField(
                  labelText: 'إيميلك',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال بريد إلكتروني صحيح';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'بريد إلكتروني غير صالح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'رقم السري',
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الرقم السري';
                    }
                    if (value.length < 6) {
                      return 'يجب أن يكون الرقم السري على الأقل 6 أحرف';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasTriedToSubmit = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission logic
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (Route<dynamic> route) => false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 44),
                    backgroundColor: theme.colorScheme.primary, // Primary color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onPrimary, // On primary color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text(
                        'إنشاء حساب جديد',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: theme.colorScheme.primary, // Primary color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'ليس لديك حساب',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: theme.colorScheme.onSurface, // On surface color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
