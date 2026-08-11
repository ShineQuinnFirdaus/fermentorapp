import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  String selectedTab = "faq";
  String selectedCategory = "general";

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
          setState(() {});
        },
      ),

      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          tr("faq_title"),
          style: const TextStyle(
            color: Color(0xFFFFC107),
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
            // Tab Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("faq", tr("faq_tab_faq")),
                _buildTab("contact", tr("faq_tab_contact")),
              ],
            ),
            const SizedBox(height: 20),

            // Category Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategory("general", tr("faq_category_general")),
                _buildCategory("account", tr("faq_category_account")),
                _buildCategory("service", tr("faq_category_service")),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: tr("faq_search_hint"),
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
                    title: Text(tr("faq_item_title", args: ["${index + 1}"])),
                    subtitle: index == 0
                        ? Text(tr("faq_item_subtitle", args: ["${index + 1}"]))
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

  Widget _buildTab(String key, String label) {
    bool isSelected = selectedTab == key;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = key),
        child: Container(
          height: 40, // tinggi tetap
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 4), // jarak antar tab
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black26),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String key, String label) {
    bool isSelected = selectedCategory == key;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = key),
      child: Container(
        width: 100, // lebar tetap semua kategori sama
        height: 36, // tinggi tetap
        alignment: Alignment.center,
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
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis, // teks panjang tetap rapi
        ),
      ),
    );
  }
}
