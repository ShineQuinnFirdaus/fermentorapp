import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'base_parameter_screen.dart';

class AlkoholScreen extends StatelessWidget {
  const AlkoholScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);

    return Stack(
      children: [
        // Memanggil BaseParameterScreen dengan key JSON
        BaseParameterScreen(
          title: tr("param_alcohol"),
          icon: Icons.local_drink,
          iconColor: const Color(0xFFFFC107),
          chartTitle: tr("param_alcohol"),
        ),

        // 🌍 Floating translate button (sama persis dengan HomePage/ProfilePage)
        Positioned(
          bottom: 20,
          right: 20,
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
            },
          ),
        ),
      ],
    );
  }
}
