import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _toggleLanguage(BuildContext context) {
    if (context.locale.languageCode == "id") {
      context.setLocale(const Locale("en"));
    } else {
      context.setLocale(const Locale("id"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF0D47A1);
    final Color accentYellow = const Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: Colors.white,

      // 🌍 Floating Globe Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.public,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () => _toggleLanguage(context),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                "assets/images/logo_fermentasi.png",
                height: 140,
              ),
              const SizedBox(height: 32),

              // Judul
              Text(
                tr("welcome_title"),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  tr("welcome_subtitle"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // 🔵 Tombol MASUK — ukuran seragam
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  fixedSize: const Size(220, 48), // ⭐ ukuran tombol sama
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                child: Text(
                  tr("welcome_btn_login"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 🟡 Tombol DAFTAR — ukuran seragam
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  fixedSize: const Size(220, 48), // ⭐ ukuran tombol sama
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()),
                  );
                },
                child: Text(
                  tr("welcome_btn_signup"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
