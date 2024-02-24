import 'dart:convert';
import 'package:eldercare/widgets/camera_widget.dart';
import 'package:eldercare/widgets/image_widget.dart';
import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:eldercare/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eldercare/widgets/clock_running.dart';
// import 'package:base64/base64.dart';

class DevicesPage extends StatelessWidget {
  DevicesPage({super.key});

  final List devicesInfo = [
    {
      'name': 'Living Room',
      'isOnline': false,
      'imageURL': 'assets/images/living_room.jpg'
    },
    {
      'name': 'Bedroom',
      'isOnline': false,
      'imageURL': 'assets/images/bedroom.jpg'
    },
    {
      'name': 'Kitchen',
      'isOnline': false,
      'imageURL': 'assets/images/kitchen.jpg'
    },
    {
      'name': 'Dining Room',
      'isOnline': false,
      'imageURL': 'assets/images/dining_room.jpg'
    },
  ];
  int activeDevice = 0;
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
    for (var device in devicesInfo) {
      if (device['isOnline'] == true) {
        activeDevice++;
      }
    }

    // convertImageToBase64(
    //         'https://getsafeandsound.com/wp-content/uploads/2018/08/maxresdefault.jpg')
    //     .then((value) => {_base64Image = value});
    // print('base64: $_base64Image');
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
                          'Devices',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Color(0xFF01016F),
                              size: 8,
                            ),
                            const SizedBox(width: 4),
                            Text('$activeDevice activate device',
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
                    IconButton(
                      onPressed: () {
                        print('Clicked on menu icon');
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                    )
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
                  Column(
                      children: devicesInfo
                          .map((device) => CameraWidget(
                              cameraName: device['name'].toString(),
                              isOnline: device['isOnline'] as bool,
                              videoWidget: ImageWidget(
                                imagePath: device['imageURL'],
                              )))
                          .toList()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TouchableOpacity(
                        child: Center(
                          child: Container(
                            width: 172,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9).withOpacity(0.6),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_outlined,
                                    size: 14,
                                    color: Color(0xFFAAAAAA),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Add new device',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        color: Color(0xFFAAAAAA)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          print('add new device');
                        }),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
