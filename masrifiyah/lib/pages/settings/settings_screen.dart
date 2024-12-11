import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrifiyah/main.dart';
import '../../login/ui/begin.dart';
import '../../login/ui/support_contact_screen.dart';
import 'personal_info_screen.dart';
import 'notification_screen.dart';
import 'terms_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool get isDarkMode => MyApp.themeNotifier.themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsRow(
                    context: context,
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
                    context: context,
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
                    context: context,
                    icon: Icons.support_agent,
                    text: "الدعم",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportContactScreen(),
                      ),
                    ),
                  ),
                  _buildSettingsRow(
                    context: context,
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
                    context: context,
                    icon: Icons.privacy_tip,
                    text: "سياسة الخصوصية",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrivacyPolicyScreen(),
                      ),
                    ),
                  ),
                  _buildThemeToggleRow(),
                ],
              ),
            ),
            Divider(color: theme.dividerColor),
            _buildSettingsRow(
              context: context,
              icon: Icons.logout,
              text: "تسجيل خروج",
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BeginScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsRow({
    required BuildContext context,
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.chevron_back,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(
                      icon,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: theme.dividerColor,
        ),
      ],
    );
  }

  Widget _buildThemeToggleRow() {
    final theme = Theme.of(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
              MyApp.themeNotifier.setThemeMode(newMode);
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 10, height: 50),
              Text(
                isDarkMode ? "الوضع الفاتح" : "الوضع الداكن",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: theme.dividerColor,
        ),
      ],
    );
  }
}
