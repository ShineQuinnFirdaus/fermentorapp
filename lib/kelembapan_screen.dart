import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'base_parameter_screen.dart';

class KelembapanScreen extends StatefulWidget {
  const KelembapanScreen({super.key});

  @override
  State<KelembapanScreen> createState() => _KelembapanScreenState();
}

class _KelembapanScreenState extends State<KelembapanScreen> {
  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    const Color primaryBlue = Color(0xFF0D47A1);

    return Stack(
      children: [
        BaseParameterScreen(
          title: tr("humidity_title"),
          icon: Icons.water_drop,
          iconColor: accentYellow,
          chartTitle: tr("humidity_chart"),
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
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
