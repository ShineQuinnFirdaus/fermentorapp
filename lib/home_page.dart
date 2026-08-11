import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'kelembapan_screen.dart';
import 'ph_screen.dart';
import 'alkohol_screen.dart';
import 'temperatur_screen.dart';
import 'custom_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _toggleLanguage() {
    if (context.locale.languageCode == "id") {
      context.setLocale(const Locale("en"));
    } else {
      context.setLocale(const Locale("id"));
    }
    setState(() {}); // rebuild agar teks update
  }

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);
    const Color primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: primaryBlue,

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        shape: const CircleBorder(),
        onPressed: _toggleLanguage,
        child: const Icon(Icons.public, color: Colors.white, size: 28),
      ),

      body: Column(
        children: [
          const CustomHeader(initials: "RP", name: "Rendha Puspita"),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul
                    Text(
                      tr("home_title_monitoring"),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subjudul
                    Text(
                      tr("home_subtitle"),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Parameter Cards
                    _buildParameterCard(
                      context,
                      "70–85%",
                      "param_humidity",
                      Icons.water_drop,
                      accentYellow,
                      const KelembapanScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "5.5",
                      "param_ph",
                      Icons.science,
                      accentYellow,
                      const PhScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "2.5%",
                      "param_alcohol",
                      Icons.local_drink,
                      accentYellow,
                      const AlkoholScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "30°C",
                      "param_temperature",
                      Icons.thermostat,
                      accentYellow,
                      const TemperaturScreen(),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParameterCard(
    BuildContext context,
    String value,
    String titleKey, // ini key JSON, bukan teks literal
    IconData icon,
    Color color,
    Widget nextPage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => nextPage));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  tr(titleKey), // pastikan key JSON dipanggil tr() di sini
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
