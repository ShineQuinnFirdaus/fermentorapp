import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'welcome_screen.dart';
import 'main_navigation.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  void _toggleLanguage() {
    if (context.locale.languageCode == "id") {
      context.setLocale(const Locale("en"));
    } else {
      context.setLocale(const Locale("id"));
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);
    const Color accentYellow = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: Colors.white,

      // 🌍 Floating Globe (SAMA seperti Welcome)
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        shape: const CircleBorder(),
        onPressed: _toggleLanguage,
        child: const Icon(Icons.public, color: Colors.white, size: 28),
      ),

      body: Stack(
        children: [
          // Background biru bagian atas
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
          ),

          Column(
            children: [
              // HEADER
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: accentYellow),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                          );
                        },
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            tr("login_title"),
                            style: const TextStyle(
                              color: accentYellow,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 48),
                    ],
                  ),
                ),
              ),

              // FORM LOGIN
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // EMAIL / NOMOR TELEPON
                        TextField(
                          decoration: InputDecoration(
                            hintText: tr("login_hint_email"),
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // PASSWORD
                        TextField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: tr("login_hint_password"),
                            filled: true,
                            fillColor: Colors.blue[50],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() => _obscurePassword = !_obscurePassword);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // LUPA PASSWORD
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              tr("login_forgot"),
                              style: const TextStyle(color: Colors.black87, fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 🔵 TOMBOL LOGIN — ukuran seragam
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            fixedSize: const Size(220, 48),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const MainNavigation()),
                            );
                          },
                          child: Text(
                            tr("login_btn"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // SUDAH PUNYA AKUN?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tr("login_no_account")),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const SignUpScreen()),
                                );
                              },
                              child: Text(
                                tr("login_register"),
                                style: const TextStyle(
                                  color: primaryBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
