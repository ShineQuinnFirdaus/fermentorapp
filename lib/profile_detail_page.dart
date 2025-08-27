import 'package:flutter/material.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Lihat Profil",
          style: TextStyle(color: Color(0xFFFFC107), fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard("No. Telepon", "********2212", onTap: () {}),
          const SizedBox(height: 12),
          _buildInfoCard("E-mail", "rendha*****@gmail.com", onTap: () {}),
          const SizedBox(height: 12),
          _buildInfoCard("Nama Lengkap", "Rendha", subtitle: "Tanggal Lahir\n9 Juni 2004", onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value,
      {String? subtitle, VoidCallback? onTap}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black87)),
                ]
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text("UBAH",
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
