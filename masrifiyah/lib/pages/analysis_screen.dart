import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Analysis Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
