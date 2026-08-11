import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'base_parameter_screen.dart';

class TemperaturScreen extends StatefulWidget {
  const TemperaturScreen({super.key});

  @override
  State<TemperaturScreen> createState() => _TemperaturScreenState();
}

class _TemperaturScreenState extends State<TemperaturScreen> {
  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    const Color primaryBlue = Color(0xFF0D47A1);

    return Stack(
      children: [
        // ❌ Jangan pakai const supaya tr() bisa update
        BaseParameterScreen(
          title: tr("temperature_title"),
          icon: Icons.thermostat,
          iconColor: accentYellow,
          chartTitle: tr("temperature_chart"),
        ),

        // 🌍 Tombol translate bulat
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton(
            backgroundColor: primaryBlue,
            shape: const CircleBorder(),
            child: const Icon(Icons.translate, color: Colors.white),
            onPressed: () {
              if (context.locale.languageCode == "id") {
                context.setLocale(const Locale("en"));
              } else {
                context.setLocale(const Locale("id"));
              }
              setState(() {}); // rebuild agar tr() update
            },
          ),
        ),
      ],
    );
  }
}
