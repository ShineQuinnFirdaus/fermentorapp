import 'package:flutter/material.dart';
import 'main_navigation.dart';

class CustomHeader extends StatelessWidget {
  final String initials;
  final String name;
  final Widget? navigatePage; // kalau ditekan profil kecil, mau ke halaman mana

  const CustomHeader({
    super.key,
    required this.initials,
    required this.name,
    this.navigatePage,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);
    const Color accentYellow = Color(0xFFFFC107);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      color: primaryBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 profil kecil kiri atas + logo kanan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (navigatePage != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => navigatePage!),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const MainNavigation(initialIndex: 2),
                      ),
                    );
                  }
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black, size: 18),
                ),
              ),
              Image.asset(
                "assets/images/logo_fermentasi.png",
                height: 40,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 🔹 avatar besar + teks
          Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: Colors.white,
                child: Text(
                  initials,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Halo,",
                    style: TextStyle(
                      color: accentYellow,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
