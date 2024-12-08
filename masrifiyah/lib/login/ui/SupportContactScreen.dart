import 'package:flutter/material.dart';

class SupportContactScreen extends StatelessWidget {
  const SupportContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تواصل مع الدعم'),
        backgroundColor: const Color(0xFFE8712B),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'للتواصل مع الدعم الفني، يرجى مراسلتنا على البريد الإلكتروني:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              SizedBox(height: 16),
              Text(
                'support@example.com',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE8712B),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'أو اتصل بنا على الرقم:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              SizedBox(height: 16),
              Text(
                '+123-456-7890',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE8712B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
