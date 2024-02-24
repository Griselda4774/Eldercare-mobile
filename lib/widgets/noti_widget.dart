import 'package:eldercare/pages/noti_detail_page.dart';
import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotiWidget extends StatelessWidget {
  const NotiWidget(
      {Key? key,
      required this.cameraName,
      required this.time,
      required this.isRead})
      : super(key: key);
  final String cameraName;
  final String time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NotiDetailPage(time: time, cameraName: cameraName)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isRead
                    ? const SizedBox(
                        width: 6,
                      )
                    : const Icon(
                        Icons.circle,
                        color: Color(0xFFD8031C),
                        size: 6,
                      ),
                const SizedBox(width: 24),
                Image.asset(
                  'assets/images/noti_image.jpg',
                  height: 40,
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'FALL DETECTED!',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cameraName,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              DateFormat('hh:mm a').format(DateTime.parse(time)),
              style: const TextStyle(
                  fontFamily: 'Lato', fontSize: 14, color: Color(0xFFA0A0A0)),
            ),
          ],
        ),
      ),
    );
  }
}
