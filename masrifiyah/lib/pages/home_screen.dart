import 'package:flutter/material.dart';
import 'settings/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide the back button
        backgroundColor: theme.colorScheme.surface, // Use theme surface color
        elevation: 0,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()),
                  );
                },
                icon: Icon(
                  Icons.notifications,
                  color: theme.colorScheme.onSurface, // Icon color
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "محمد أحمد",
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface, // Text color
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "مرحباً بك",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: theme
                              .colorScheme.onSurfaceVariant, // Subtitle color
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/profile_picture.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Payments Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'إظهار الكل',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  'سجل المدفوعات',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Transactions List
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem(
                    icon: Icons.apple,
                    iconColor: theme.colorScheme.onSurface,
                    textColor: theme.colorScheme.onSurface,
                    title: 'Apple Store',
                    category: 'Entertainment',
                    amount: '-\$5.99',
                    amountColor: theme.colorScheme.onSurface,
                  ),
                  _buildTransactionItem(
                    icon: Icons.music_note,
                    iconColor: Colors.green,
                    textColor: theme.colorScheme.onSurface,
                    title: 'Spotify',
                    category: 'Music',
                    amount: '-\$12.99',
                    amountColor: theme.colorScheme.onSurface,
                  ),
                  _buildTransactionItem(
                    icon: Icons.send,
                    iconColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.onSurface,
                    title: 'Money Transfer',
                    category: 'Transaction',
                    amount: '\$300',
                    amountColor: theme.colorScheme.primary,
                  ),
                  _buildTransactionItem(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.red,
                    textColor: theme.colorScheme.onSurface,
                    title: 'Grocery',
                    category: 'Shopping',
                    amount: '\$88',
                    amountColor: theme.colorScheme.onSurface,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Credit Score Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'سجل الائتماني',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'رصيدك الائتماني في حالة جيدة',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Credit Score Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('300',
                          style: textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant)),
                      Text('850',
                          style: textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required Color textColor,
    required String title,
    required String category,
    required String amount,
    required Color amountColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: iconColor.withOpacity(0.1),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
