import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool agreeToTerms = false;
  bool hasTriedToSubmit = false; // Tracks if the user tried to submit

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

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
                        color: theme.colorScheme.primary, // Use theme color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                CustomTextFormField(
                  labelText: 'الاسم الكامل',
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم الكامل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
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
                CustomTextFormField(
                  labelText: 'تأكيد من الرقم السري',
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء تأكيد الرقم السري';
                    }
                    if (value != passwordController.text) {
                      return 'الرقم السري غير مطابق';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'من خلال إنشاء حساب فإنك توافق على ',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            color: theme.colorScheme.onSurface, // Theme color
                          ),
                          children: [
                            TextSpan(
                              text: 'شروطنا وأحكامنا',
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: 15,
                                color: theme.colorScheme.primary, // Theme color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Checkbox(
                      activeColor: theme.colorScheme.primary, // Theme color
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                  ],
                ),
                if (!agreeToTerms && hasTriedToSubmit)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'يجب الموافقة على الشروط والأحكام للاستمرار',
                      style: textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.error, // Error color
                        fontSize: 12,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasTriedToSubmit =
                          true; // Track that the user attempted submission
                    });
                    if (_formKey.currentState!.validate() && agreeToTerms) {
                      // Handle form submission logic
                      print('Full Name: ${fullNameController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (Route<dynamic> route) => false);
                    } else if (!agreeToTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              const Text('الرجاء الموافقة على الشروط والأحكام'),
                          backgroundColor:
                              theme.colorScheme.error, // Theme color
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 44),
                    backgroundColor: theme.colorScheme.primary, // Theme color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'إنشاء حساب جديد',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onPrimary, // Theme color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigate to login screen
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'تسجيل دخول',
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: theme.colorScheme.primary, // Theme color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'هل لديك حساب؟',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        color: theme.colorScheme.onSurface, // Theme color
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

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.outline, // Theme color
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.outline, // Theme color
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.primary, // Theme color
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
      ),
      style: textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        color: theme.colorScheme.onSurface, // Theme color
      ),
      validator: validator,
    );
  }
}
