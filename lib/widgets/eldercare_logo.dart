import 'package:flutter/material.dart';

class EldercareLogo extends StatelessWidget {
  const EldercareLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            color: Color(0xFF555555)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 148,
              height: 148,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  color: Color(0xffffffff)),
            ),
            const Icon(Icons.elderly, size: 92, color: Color(0xff555555))
          ],
        ));
  }
}
