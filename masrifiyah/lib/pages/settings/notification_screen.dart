import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface, // Use theme surface color
        elevation: 0,
        title: Text(
          "الإشعارات",
          style: textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface, // AppBar title color
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
        child: ListView.separated(
          itemCount: 5, // Example: 5 notifications
          separatorBuilder: (context, index) => Divider(
            color: theme.dividerColor, // Theme divider color
            thickness: 0.5,
          ),
          itemBuilder: (context, index) {
            return _buildNotificationItem(
              context: context,
              title: "إشعار ${index + 1}",
              content: "هذا هو نص الإشعار رقم ${index + 1} للتجربة.",
              time: "قبل ١ ساعة",
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required BuildContext context,
    required String title,
    required String content,
    required String time,
  }) {
    final theme = Theme.of(context); // Get the current theme

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface, // Title color
            ),
        textAlign: TextAlign.right,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: theme.colorScheme.onSurfaceVariant, // Subtitle color
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              color: theme.colorScheme.onSurfaceVariant, // Timestamp color
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: theme.colorScheme.primary, // Avatar background color
        child: Icon(
          Icons.notifications,
          color: theme.colorScheme.onPrimary, // Icon color
        ),
      ),
    );
  }
}
