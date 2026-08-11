import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,

      // 🌍 Tombol translate bulat
      floatingActionButton: FloatingActionButton(
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

      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          tr("change_password_title"),
          style: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Form Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: tr("old_password"),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: tr("new_password"),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: tr("confirm_new_password"),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                ),
                onPressed: () {
                  // TODO: Implement change password logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(tr("change_password_success"))),
                  );
                },
                child: Text(
                  tr("save"),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
