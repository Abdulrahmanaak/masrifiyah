import 'package:flutter/material.dart';
import 'package:masrifiyah/pages/settings/notification_screen.dart';

class BanksScreen extends StatelessWidget {
  const BanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

    final supportedBanks = [
      {"name": "بنك الرياض", "image": "assets/riyadh.jpg"},
      {"name": "البنك الأهلي", "image": "assets/alahli.png"},
      {"name": "مصرف الراجحي", "image": "assets/rajhi.png"},
    ];

    final upcomingBanks = [
      {"name": "بنك ساب", "image": "assets/sab.png"},
      {"name": "بنك الانماء", "image": "assets/alinma.png"},
    ];

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
      backgroundColor: theme.colorScheme.surface, // Background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            _buildSectionTitle(context, "البنوك المدعومة"),
            const SizedBox(height: 16),
            _buildBankGrid(context, supportedBanks),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "البنوك القادمة"),
            const SizedBox(height: 16),
            _buildBankGrid(context, upcomingBanks),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context); // Get the current theme

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            color: theme.colorScheme.primary, // Divider color
            thickness: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface, // Text color
                ),
          ),
        ),
        Expanded(
          child: Divider(
            color: theme.colorScheme.primary, // Divider color
            thickness: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildBankGrid(BuildContext context, List<Map<String, String>> banks) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: banks.length,
      itemBuilder: (context, index) {
        final bank = banks[index];
        return _buildBankCard(context, bank['name']!, bank['image']!);
      },
    );
  }

  Widget _buildBankCard(BuildContext context, String name, String imagePath) {
    final theme = Theme.of(context); // Get the current theme

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurface, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
