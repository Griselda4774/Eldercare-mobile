import 'package:flutter/material.dart';
import 'package:eldercare/pages/devices_page.dart';
import 'package:eldercare/pages/notifications_page.dart';
import 'package:eldercare/pages/setting_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    // navigate to the selected page
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    // devices page
    DevicesPage(),
    // notifications page
    NotificationsPage(),
    // settings page
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          selectedItemColor: const Color(0xFF39A7FF),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
