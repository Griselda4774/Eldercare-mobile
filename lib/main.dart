import 'package:eldercare/pages/noti_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:eldercare/pages/bottom_bar.dart';
import 'package:eldercare/pages/notifications_page.dart';
import 'package:eldercare/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomBarPage(),
      routes: {
        '/devices': (context) => const BottomBarPage(),
        '/notifications': (context) => NotificationsPage(),
        '/settings': (context) => const SettingPage(),
        '/bottombar': (context) => const BottomBarPage(),
        '/notificationsdetail': (context) => const NotiDetailPage(),
      },
    );
  }
}
