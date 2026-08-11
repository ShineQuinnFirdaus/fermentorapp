import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'base_parameter_screen.dart';

class PhScreen extends StatefulWidget {
  const PhScreen({super.key});

  @override
  State<PhScreen> createState() => _PhScreenState();
}

class _PhScreenState extends State<PhScreen> {
  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    const Color primaryBlue = Color(0xFF0D47A1);

    return Stack(
      children: [
        BaseParameterScreen(
          title: tr("ph_title"),
          icon: Icons.science,
          iconColor: accentYellow,
          chartTitle: tr("ph_chart"),
        ),
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
              setState(() {}); // ⚡ rebuild agar tr() update
            },
          ),
        ),
      ],
    );
  }
}
