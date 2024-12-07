import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "الإشعارات",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white, // White background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: 5, // Example: 5 notifications
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          itemBuilder: (context, index) {
            return _buildNotificationItem(
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
    required String title,
    required String content,
    required String time,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.right,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
      leading: const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
    );
  }
}
