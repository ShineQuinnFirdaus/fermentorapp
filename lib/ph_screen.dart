import 'package:flutter/material.dart';
import 'base_parameter_screen.dart';

class PhScreen extends StatelessWidget {
  const PhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    return const BaseParameterScreen(
      title: "Grafik Parameter pH",
      icon: Icons.science,
      iconColor: accentYellow,
      chartTitle: "Kadar pH",
    );
  }
}
