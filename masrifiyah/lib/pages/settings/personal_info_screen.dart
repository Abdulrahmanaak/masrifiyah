import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with sample user data
    _nameController.text = "محمد أحمد";
    _emailController.text = "mohamed.ahmed@example.com";
    _phoneController.text = "+966 123 456 789";
    _birthdateController.text = "01 يناير 1995";
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthdateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme
    final textTheme = theme.textTheme; // Access theme's text styles

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface, // Use theme surface color
        elevation: 0,
        title: Text(
          "المعلومات الشخصية",
          style: textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface, // AppBar title color
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface, // Back button color
        ),
      ),
      backgroundColor: theme.colorScheme.surface, // Use theme background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: theme
                    .colorScheme.surfaceContainerHighest, // Avatar background
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profile_picture.png"),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildInputField(
              label: "الاسم",
              controller: _nameController,
              icon: Icons.person,
              theme: theme,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: "البريد الإلكتروني",
              controller: _emailController,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              theme: theme,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: "رقم الهاتف",
              controller: _phoneController,
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
              theme: theme,
            ),
            const SizedBox(height: 16),
            _buildDateField(
              label: "تاريخ الميلاد",
              controller: _birthdateController,
              context: context,
              icon: Icons.calendar_today,
              theme: theme,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic for saving changes
                  print("Name: ${_nameController.text}");
                  print("Email: ${_emailController.text}");
                  print("Phone: ${_phoneController.text}");
                  print("Birthdate: ${_birthdateController.text}");
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary, // Button color
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                ),
                child: Text(
                  "حفظ",
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: theme.colorScheme.onPrimary, // Button text color
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required ThemeData theme,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface, // Label color
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon:
                Icon(icon, color: theme.colorScheme.onSurface), // Icon color
            filled: true,
            fillColor: theme.colorScheme.surface, // Input field background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: theme.colorScheme.outline), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: theme.colorScheme.outline), // Border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: theme.colorScheme.primary), // Focused border color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required BuildContext context,
    required ThemeData theme,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface, // Label color
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                suffixIcon: Icon(icon,
                    color: theme.colorScheme.onSurface), // Icon color
                filled: true,
                fillColor: theme.colorScheme.surface, // Input field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.colorScheme.outline), // Border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.colorScheme.outline), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: theme.colorScheme.primary), // Focused border color
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
