import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'tanggal_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _selectedIndex;

  final Color primaryBlue = const Color(0xFF0D47A1);

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  /// 🔹 Gunakan IndexedStack supaya state halaman tidak hilang saat ganti tab
  final List<Widget> _pages = const [
    HomePage(),
    TanggalPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Tanggal"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun Saya"),
        ],
      ),
    );
  }
}
