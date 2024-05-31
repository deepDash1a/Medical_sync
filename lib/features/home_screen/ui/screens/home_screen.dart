import 'package:flutter/material.dart';
import 'package:medical_sync/core/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 32.00,
            fontWeight: FontWeight.bold,
            color: ColorManager.greenColor,
          ),
        ),
      ),
    );
  }
}
