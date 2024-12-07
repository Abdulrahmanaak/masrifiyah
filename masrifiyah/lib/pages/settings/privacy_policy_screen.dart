import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "سياسة الخصوصية",
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
                "مرحبًا بك في سياسة الخصوصية الخاصة بنا!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "نحن ملتزمون بحماية خصوصيتك وضمان أمان بياناتك. من خلال استخدامك لتطبيقنا، فإنك توافق على جمع واستخدام المعلومات وفقًا لهذه السياسة.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "1. المعلومات التي نجمعها:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "نقوم بجمع المعلومات التي تقدمها مباشرةً عند التسجيل أو استخدام التطبيق، بما في ذلك الاسم، البريد الإلكتروني، ورقم الهاتف.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "2. كيف نستخدم معلوماتك:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "نستخدم المعلومات لتقديم الخدمات، تحسين تجربة المستخدم، وإرسال الإشعارات المهمة.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "3. حماية المعلومات:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "نتخذ التدابير الأمنية اللازمة لحماية بياناتك من الوصول غير المصرح به أو التغيير أو الإفشاء.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "4. التغييرات على السياسة:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "نحتفظ بالحق في تحديث هذه السياسة في أي وقت. سيتم إخطار المستخدمين بالتغييرات الرئيسية.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "إذا كان لديك أي استفسارات حول سياسة الخصوصية، يُرجى التواصل مع فريق الدعم.",
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
