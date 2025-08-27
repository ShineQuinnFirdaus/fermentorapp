import 'package:flutter/material.dart';
import 'kelembapan_screen.dart';
import 'ph_screen.dart';
import 'alkohol_screen.dart';
import 'temperatur_screen.dart';
import 'custom_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color accentYellow = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      body: Column(
        children: [
          const CustomHeader(initials: "RP", name: "Rendha Puspita"),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20), // top padding seperti TanggalDetailPage
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Monitoring Parameter",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Pada Proses Fermentasi Beras Ketan Putih",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30), // jarak sebelum list parameter

                    // List parameter
                    _buildParameterCard(
                      context,
                      "70–85%",
                      "Kelembapan",
                      Icons.water_drop,
                      accentYellow,
                      const KelembapanScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "5.5",
                      "Kadar PH",
                      Icons.science,
                      accentYellow,
                      const PhScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "2.5%",
                      "Kadar Alkohol",
                      Icons.local_drink,
                      accentYellow,
                      const AlkoholScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildParameterCard(
                      context,
                      "30°C",
                      "Temperatur",
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
    String title,
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
                Text(title, style: const TextStyle(color: Colors.black54)),
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
