import 'package:eldercare/widgets/noti_widget.dart';
import 'package:flutter/material.dart';
import 'package:eldercare/widgets/touchableopacity.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});
  final List notifications = [
    {'cameraName': 'Living Room', 'time': '10:00 AM', 'isRead': false},
    {'cameraName': 'Bedroom', 'time': '11:00 AM', 'isRead': true},
    {'cameraName': 'Kitchen', 'time': '12:00 PM', 'isRead': false},
    {'cameraName': 'Living Room', 'time': '10:00 AM', 'isRead': false},
    {'cameraName': 'Bedroom', 'time': '11:00 AM', 'isRead': true},
    {'cameraName': 'Kitchen', 'time': '12:00 PM', 'isRead': false},
    {'cameraName': 'Living Room', 'time': '10:00 AM', 'isRead': false},
    {'cameraName': 'Bedroom', 'time': '11:00 AM', 'isRead': true},
    {'cameraName': 'Kitchen', 'time': '12:00 PM', 'isRead': false},
    {'cameraName': 'Kitchen', 'time': '12:00 PM', 'isRead': false},
  ];

  int unreadNotifications = 0;
  @override
  Widget build(BuildContext context) {
    for (var notification in notifications) {
      if (!notification['isRead']) {
        unreadNotifications++;
      }
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Color(0xFFD8031C),
                              size: 8,
                            ),
                            const SizedBox(width: 4),
                            Text('$unreadNotifications Notifications unread',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.01,
                                    height: 0.5)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Text('Today',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    children: notifications
                        .map((noti) => NotiWidget(
                            cameraName: noti['cameraName'],
                            time: noti['time'],
                            isRead: noti['isRead']))
                        .toList(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32, top: 16, bottom: 8),
                    child: Text('Yesterday',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold)),
                  ),
                  Column(
                    children: notifications
                        .map((noti) => NotiWidget(
                            cameraName: noti['cameraName'],
                            time: noti['time'],
                            isRead: noti['isRead']))
                        .toList(),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
