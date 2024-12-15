import 'package:flutter/material.dart';
import 'dart:math';

class LoanCalculatorPage extends StatefulWidget {
  @override
  _LoanCalculatorPageState createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  // Controllers for user inputs
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();

  // List of banks with their interest rates and logos
  final List<Map<String, dynamic>> _banks = [
    {
      'name': 'مصرف الراجحي', // Bank name
      'interestRate': 3.5,    // Annual interest rate in %
      'logo': 'assets/rajhi.png', // Path to bank's logo asset
    },
    {
      'name': 'البنك الأهلي',
      'interestRate': 4.2,
      'logo': 'assets/alahli.png',
    },
    {
      'name': 'بنك الرياض',
      'interestRate': 3.8,
      'logo': 'assets/riyadh.jpg',
    },
  ];

  // Stores the calculation results to display in the UI
  List<Map<String, dynamic>> _results = [];

  // Function to calculate EMI and related details for each bank
  void _calculateEMI() {
    // Parse loan amount and tenure from user input
    final double amount = double.tryParse(_amountController.text) ?? 0;
    final int tenureYears = int.tryParse(_tenureController.text) ?? 0;

    // Validation: Ensure valid input values
    if (amount <= 0 || tenureYears <= 0) {
      _showErrorDialog('يرجى إدخال مبلغ قرض ومدة صالحة.'); // Show error message in case of invalid input
      return;
    }

    final int totalMonths = tenureYears * 12; // Convert years to months for EMI calculation
    List<Map<String, dynamic>> results = [];

    for (final bank in _banks) {
      final double monthlyRate = bank['interestRate'] / 12 / 100; // Monthly interest rate
      // EMI formula
      final double emi = (amount * monthlyRate * pow(1 + monthlyRate, totalMonths)) /
          (pow(1 + monthlyRate, totalMonths) - 1);
      final double totalPayable = emi * totalMonths; // Total payment over the loan period
      final double totalInterest = totalPayable - amount; // Total interest to be paid

      // Add the calculated data to results list
      results.add({
        'bank': bank['name'] ?? 'بنك غير معروف',
        'logo': bank['logo'],
        'emi': emi,
        'totalInterest': totalInterest,
        'totalPayable': totalPayable,
      });
    }

    // Sort results by lowest EMI to show the best options first
    results.sort((a, b) => a['emi'].compareTo(b['emi']));

    setState(() {
      _results = results; // Update the UI with the calculated results
    });
  }

  // Function to display an error message dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text('خطأ', textAlign: TextAlign.right), // Title of the error dialog
          content: Text(message, textAlign: TextAlign.right), // Error message
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog on button press
              child: Text('موافق', textAlign: TextAlign.right),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color accentColor = Colors.orange; // Accent color for the app's UI

    return Directionality(
      textDirection: TextDirection.rtl, // RTL for Arabic support
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section with title and description
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 100, bottom: 40, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.calculate, color: accentColor, size: 50), // Calculator icon
                    SizedBox(height: 10),
                    Text(
                      'حاسبة القروض',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right, // Align text to the right for Arabic
                    ),
                    SizedBox(height: 5),
                    Text(
                      'احسب أفضل القروض المتاحة بسهولة.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),

              // Input Section for loan amount and tenure
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // TextField for loan amount input
                        TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number, // Numeric input
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'مبلغ القرض (ريال سعودي)',
                            hintText: 'أدخل مبلغ القرض',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.monetization_on, color: accentColor),
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 16),
                        // TextField for loan tenure input
                        TextField(
                          controller: _tenureController,
                          keyboardType: TextInputType.number, // Numeric input
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'مدة القرض (بالسنوات)',
                            hintText: 'أدخل المدة بالسنوات',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.timer, color: accentColor),
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 16),
                        // Button to trigger EMI calculation
                        OutlinedButton(
                          onPressed: _calculateEMI,
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            side: BorderSide(width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'احسب',
                            style: TextStyle(
                              fontSize: 16,
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Results Section to display calculated EMI and other details
              _results.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _results.map((result) {
                          return Card(
                            elevation: 1,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  // Display bank logo or fallback icon
                                  result['logo'] != null
                                      ? Image.asset(
                                          result['logo'],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.contain,
                                        )
                                      : Icon(Icons.account_balance, size: 50),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Bank name
                                        Text(
                                          result['bank'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                        SizedBox(height: 5),
                                        // EMI and interest details
                                        Text(
                                          'القسط الشهري: ${result['emi']?.toStringAsFixed(2) ?? 'غير متوفر'} ريال',
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          'إجمالي الفائدة: ${result['totalInterest']?.toStringAsFixed(2) ?? 'غير متوفر'} ريال',
                                          style: TextStyle(fontSize: 14),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'أدخل بيانات القرض لعرض أفضل الخيارات.', // Default message when no results
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: ThemeMode.system, // Adapts to system settings
      home: LoanCalculatorPage(),
    ),
  );
}
