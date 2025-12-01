import 'package:flutter/material.dart';
import 'package:myapp_first/screens/auth/profile.dart';
import 'package:myapp_first/screens/beranda.dart';
import 'package:myapp_first/screens/item_list.dart';
import 'package:myapp_first/screens/jelajahi.dart';
import 'package:myapp_first/screens/tugas.dart';
import 'package:permission_handler/permission_handler.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    BerandaScreen(),
    JelajahiScreen(),
    TugasScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () async {
            var status = await Permission.camera.request();

            if (status.isGranted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kamera berhasil diberikan akses")),
              );
            } else if (status.isDenied) {
              await Permission.camera.request();
            } else if (status.isPermanentlyDenied) {
              openAppSettings();
            }
          },
          shape: CircleBorder(),
          backgroundColor: Colors.yellow,
          child: Icon(Icons.qr_code_scanner_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // navbar kiri
              Row(
                children: [
                  _buildNavItem("Beranda", Icons.home, 0),
                  _buildNavItem("Jelajahi", Icons.travel_explore, 1),
                ],
              ),
              // navbar kanan
              Row(
                children: [
                  _buildNavItem("Tugas", Icons.task, 2),
                  _buildNavItem("Profile", Icons.person_outline_outlined, 3),
                ],
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
    );
  }

  Widget _buildNavItem(String title, IconData icon, int index) {
    final isActive = _selectedIndex == index;
    final color = isActive ? Colors.green : Colors.black;

    return MaterialButton(
      minWidth: 60,
      onPressed: () => _onTabTapped(index),
      child: Column(
        children: [
          Icon(icon, size: 30, color: color),
          Text(title, style: TextStyle(fontSize: 15, color: color)),
        ],
      ),
    );
  }
}
