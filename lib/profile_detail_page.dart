import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  // Data yang dapat diubah
  String phone = "********2212";
  String email = "rendha*****@gmail.com";
  String fullName = "Rendha";
  String birthDate = "9 Juni 2004";

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,

      // 🌍 Tombol Translate Bulat
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        shape: const CircleBorder(), // pastikan bulat
        child: const Icon(Icons.public, color: Colors.white),
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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          tr("profile_view_profile"), // Lihat Profil
          style: const TextStyle(
            color: Color(0xFFFFC107),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard(
            tr("detail_phone"),
            phone,
            onTap: () => _showEditDialog(tr("detail_phone"), phone, (newValue) {
              setState(() => phone = newValue);
            }),
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            tr("detail_email"),
            email,
            onTap: () => _showEditDialog(tr("detail_email"), email, (newValue) {
              setState(() => email = newValue);
            }),
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            tr("detail_fullname"),
            fullName,
            subtitle: "${tr("detail_birthdate")}\n$birthDate",
            onTap: () => _showEditDialog(tr("detail_fullname"), fullName, (newValue) {
              setState(() => fullName = newValue);
            }),
          ),
        ],
      ),
    );
  }

  /// Popup dialog untuk edit data
  void _showEditDialog(
    String title,
    String currentValue,
    Function(String) onSave,
  ) {
    final TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("${tr("detail_edit")} $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: title),
        ),
        actions: [
          TextButton(
            child: Text(tr("detail_cancel")),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text(tr("detail_save")),
            onPressed: () {
              onSave(controller.text.trim());
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String value, {
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              tr("detail_edit"), // "UBAH"
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
