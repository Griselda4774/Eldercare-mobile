import 'package:flutter/material.dart';
import 'package:eldercare/components/touchableopacity.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});
  final List _notifications = [
    {'cameraName': 'Living Room', 'time': '10:00 AM', 'isRead': false},
    {'cameraName': 'Bedroom', 'time': '11:00 AM', 'isRead': true},
    {'cameraName': 'Kitchen', 'time': '12:00 PM', 'isRead': false},
  ];

  int _unreadNotifications = 0;
  @override
  Widget build(BuildContext context) {
    for (var notification in _notifications) {
      if (!notification['isRead']) {
        _unreadNotifications++;
      }
    }
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24, height: 0.9),
                  ),
                  Text(
                    '$_unreadNotifications not read',
                    style:
                        const TextStyle(color: Color(0xFF666666), fontSize: 14),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _notifications
                    .map((notification) => Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, top: 12, bottom: 12),
                        child: TouchableOpacity(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFCACACA), width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0))),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 20, top: 12, bottom: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      const Icon(
                                        Icons.warning,
                                        size: 60,
                                        color: Color(0xFFF04826),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'FALL DETECTED!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                                'at ${notification['cameraName']}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF000000))),
                                            Text(
                                              notification['time'],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF666666)),
                                            )
                                          ])
                                    ]),
                                    notification['isRead']
                                        ? const Icon(
                                            Icons.circle,
                                            size: 12,
                                            color: Color(0xFF39A7FF),
                                          )
                                        : const SizedBox()
                                  ],
                                )),
                          ),
                          onTap: () {
                            print('clicked');
                          },
                        )))
                    .toList(),
              ),
            )
          ]),
    );
  }
}
