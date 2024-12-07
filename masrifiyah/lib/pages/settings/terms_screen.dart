import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "الشروط والأحكام",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl, // Right-to-left text alignment
          child: ListView(
            children: const [
              Text(
                "مرحبًا بك في تطبيقنا!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "يرجى قراءة الشروط والأحكام بعناية قبل استخدام التطبيق. باستخدامك للتطبيق، فإنك توافق على الالتزام بالشروط التالية:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "1. استخدام التطبيق:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "يجب استخدام التطبيق فقط للأغراض القانونية والمصرح بها. يُحظر أي استخدام غير قانوني أو ضار.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "2. حقوق الملكية:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "جميع المحتويات والمواد الموجودة في التطبيق محمية بموجب حقوق النشر وحقوق الملكية الفكرية.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "3. التغييرات في الشروط:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إخطار المستخدمين بالتغييرات عبر التطبيق.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "4. المسؤوليات:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "المستخدم مسؤول عن الحفاظ على أمان حسابه وكلمة المرور الخاصة به. نحن غير مسؤولين عن أي استخدام غير مصرح به لحسابك.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "إذا كان لديك أي استفسارات حول الشروط والأحكام، يُرجى التواصل مع فريق الدعم.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
