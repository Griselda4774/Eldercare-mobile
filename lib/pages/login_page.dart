import 'package:flutter/material.dart';
import 'package:eldercare/components/touchableopacity.dart';
import 'package:eldercare/pages/bottom_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                          color: Color(0xffffffff)),
                    ),
                    const Icon(Icons.elderly,
                        size: 92, color: Color(0xff555555))
                  ],
                )),
            const Text('ElderCare',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 0, bottom: 20),
              child: TouchableOpacity(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomBarPage()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF39A7FF),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
