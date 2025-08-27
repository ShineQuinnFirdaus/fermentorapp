import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  String selectedTab = "FAQ";
  String selectedCategory = "Umum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tentang Aplikasi (FAQ)",
          style: TextStyle(
            color: Color(0xFFFFC107),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // 🔹 Judul ditengah
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
            // Tab Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("FAQ"),
                _buildTab("Hubungi Kami"),
              ],
            ),
            const SizedBox(height: 20),

            // Category Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategory("Umum"),
                _buildCategory("Tentang Akun"),
                _buildCategory("Servis"),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // FAQ List
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text("Lorem ipsum dolor sit amet?"),
                    subtitle: index == 0
                        ? const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit...")
                        : null,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label) {
    bool isSelected = selectedTab == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black26),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black26),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
