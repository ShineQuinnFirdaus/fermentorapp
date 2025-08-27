import 'package:flutter/material.dart';
import 'base_parameter_screen.dart';

class KelembapanScreen extends StatelessWidget {
  const KelembapanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    return const BaseParameterScreen(
      title: "Grafik Parameter Kelembapan",
      icon: Icons.water_drop,
      iconColor: accentYellow,
      chartTitle: "Kelembapan",
    );
  }
}
