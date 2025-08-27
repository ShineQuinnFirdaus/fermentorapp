import 'package:flutter/material.dart';
import 'base_parameter_screen.dart';

class AlkoholScreen extends StatelessWidget {
  const AlkoholScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    return const BaseParameterScreen(
      title: "Grafik Parameter Alkohol",
      icon: Icons.local_drink,
      iconColor: accentYellow,
      chartTitle: "Kadar Alkohol",
    );
  }
}
