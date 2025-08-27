import 'dart:io';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart' hide Border; // 🔹 Hide Border supaya tidak bentrok dengan Flutter
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import 'main_navigation.dart'; // ✅ Tambahkan ini

class BaseParameterScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String chartTitle;

  const BaseParameterScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.chartTitle,
  });

  Future<void> _exportToExcel(BuildContext context) async {
    try {
      var excel = Excel.createExcel();
      Sheet sheet = excel['Sheet1'];

      // 🔹 Isi data contoh
      sheet.appendRow(["Tanggal", chartTitle]);
      sheet.appendRow(["2025-08-26", "25"]);

      // 🔹 Tentukan lokasi penyimpanan
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$chartTitle.xlsx";

      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(excel.encode()!);

      // 🔹 Buka file langsung
      await OpenFile.open(filePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("File berhasil diekspor: $filePath")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal ekspor: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🔹 Background biru atas
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
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
              // 🔹 Header (profil kecil + logo)
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // ✅ Navigasi ke MainNavigation tab Profile (index = 2)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainNavigation(initialIndex: 2),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person,
                              color: Colors.black, size: 18),
                        ),
                      ),
                      Image.asset(
                        "assets/images/logo_fermentasi.png",
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Judul halaman
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black87),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // 🔹 Konten utama
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: iconColor,
                            child: Icon(icon, color: Colors.white),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            chartTitle,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "Per-Hari",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Center(
                          child: Text("Grafik Rata-Rata $chartTitle Per-Hari"),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 14),
                          ),
                          onPressed: () => _exportToExcel(context),
                          child: const Text(
                            "Ekspor ke Excel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
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
