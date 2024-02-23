import 'package:eldercare/widgets/eldercare_logo.dart';
import 'package:flutter/material.dart';
import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:eldercare/widgets/warning_alert.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 32, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, height: 0.9),
                )
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TouchableOpacity(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF39A7FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        padding: const EdgeInsets.all(12),
                        alignment: Alignment.center,
                        child: const Text(
                          'Show noti',
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) =>
                                const WarningAlert(cameraName: 'Camera 1'),
                            barrierDismissible: false);
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20),
                //   child: TouchableOpacity(
                //       child: Container(
                //         decoration: const BoxDecoration(
                //             color: Color(0xFF39A7FF),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(8.0))),
                //         padding: const EdgeInsets.all(12),
                //         alignment: Alignment.center,
                //         child: const Text(
                //           'Logout',
                //           style: TextStyle(color: Color(0xffffffff)),
                //         ),
                //       ),
                //       onTap: () {
                //         Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const LoginPage()));
                //       }),
                // ),
                const EldercareLogo(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
