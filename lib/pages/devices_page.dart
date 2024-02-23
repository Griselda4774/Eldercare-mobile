import 'dart:convert';
import 'package:eldercare/components/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eldercare/components/clock_running.dart';
// import 'package:base64/base64.dart';

class DevicesPage extends StatelessWidget {
  DevicesPage({super.key});

  final List devicesInfo = [
    {'name': 'Living Room'},
    {'name': 'Bedroom'},
    {'name': 'Kitchen'},
  ];
  // final List<Widget> _devicesList = [];
  // Future<String?> convertImageToBase64(String imageUrl) async {
  //   final response = await http.get(Uri.parse(imageUrl));
  //   if (response.statusCode == 200) {
  //     final bytes = response.bodyBytes;
  //     final base64String = base64Encode(bytes);
  //     return base64String;
  //   } else {
  //     throw Exception('Failed to load image');
  //   }
  // }

  // String? _base64Image;

  @override
  Widget build(BuildContext context) {
    // for (var device in _devicesInfo) {
    //   _devicesList.add(ListTile(
    //     leading: const Icon(Icons.tv),
    //     title: Text(device['name']),
    //     subtitle: const Text('Smart TV'),
    //     trailing: const Icon(Icons.more_vert),
    //   ));
    // }

    // convertImageToBase64(
    //         'https://getsafeandsound.com/wp-content/uploads/2018/08/maxresdefault.jpg')
    //     .then((value) => {_base64Image = value});
    // print('base64: $_base64Image');
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
                  'Devices',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, height: 0.9),
                ),
                Text(
                  '1 active device',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: devicesInfo
                  .map((device) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF39A7FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: VideoPlayerWidget(
                                      cameraName: device['name'].toString(),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ))
        ],
      ),
    );
  }
}
