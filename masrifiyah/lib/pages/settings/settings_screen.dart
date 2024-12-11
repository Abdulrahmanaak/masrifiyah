import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'personal_info_screen.dart';
import 'notification_screen.dart';
import 'support_screen.dart';
import 'terms_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(height: 20), // Space between the logo and the tabs
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsRow(
                    icon: Icons.person,
                    text: "المعلومات الشخصية",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfoScreen(),
                      ),
                    ),
                  ),
                  _buildSettingsRow(
                    icon: Icons.notifications,
                    text: "التنبيهات",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsPage(),
                      ),
                    ),
                  ),
                  _buildSettingsRow(
                    icon: Icons.support_agent,
                    text: "الدعم",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportScreen(),
                      ),
                    ),
                  ),
                  _buildSettingsRow(
                    icon: Icons.rule,
                    text: "الشروط والأحكام",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsScreen(),
                      ),
                    ),
                  ),
                  _buildSettingsRow(
                    icon: Icons.privacy_tip,
                    text: "سياسة الخصوصية",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Logout button
            _buildSettingsRow(
              icon: Icons.logout,
              text: "تسجيل خروج",
              onTap: () {
                // Add logout functionality here
                print("Logged out");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsRow({
    required IconData icon,
    required String text,
    Color textColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Chevron on the left
              Icon(
                CupertinoIcons.chevron_back,
                color: Colors.grey[500],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(icon, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
