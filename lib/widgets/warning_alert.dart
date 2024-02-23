import 'package:flutter/material.dart';

class WarningAlert extends StatelessWidget {
  const WarningAlert({super.key, required this.cameraName});
  final String cameraName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Column(children: [
        Icon(
          Icons.warning,
          size: 80,
          color: Color(0xFFF04826),
        ),
        Text(
          'FALL DETECTED!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ])),
      content: RichText(
        text: TextSpan(
            text: 'Someone has fallen in the ',
            style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            children: [
              TextSpan(
                  text: '$cameraName!',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF39A7FF),
                      fontWeight: FontWeight.bold))
            ]),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Color(0xFF39A7FF), fontSize: 14),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'View details',
              style: TextStyle(color: Color(0xFF39A7FF), fontSize: 14),
            )),
      ],
    );
  }
}
