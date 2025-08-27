import 'package:flutter/material.dart';
import 'base_parameter_screen.dart';

class TemperaturScreen extends StatelessWidget {
  const TemperaturScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    return const BaseParameterScreen(
      title: "Grafik Parameter Temperatur",
      icon: Icons.thermostat,
      iconColor: accentYellow,
      chartTitle: "Temperatur",
    );
  }
}
