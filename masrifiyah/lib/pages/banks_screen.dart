import 'package:flutter/material.dart';

class BanksScreen extends StatelessWidget {
  const BanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Banks Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
