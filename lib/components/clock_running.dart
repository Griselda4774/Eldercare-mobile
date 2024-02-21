import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockRunning extends StatelessWidget {
  const ClockRunning({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (content, snapshot) {
          return Stack(
            children: [
              Text(DateFormat('MM/dd/yyyy hh:mm:ss').format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 16,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.black)),
              Text(DateFormat('MM/dd/yyyy hh:mm:ss').format(DateTime.now()),
                  style: const TextStyle(fontSize: 16, color: Colors.white))
            ],
          );
        });
  }
}
