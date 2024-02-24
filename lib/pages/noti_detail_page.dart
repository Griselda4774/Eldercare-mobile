import 'package:eldercare/widgets/camera_widget.dart';
import 'package:eldercare/widgets/image_widget.dart';
import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotiDetailPage extends StatefulWidget {
  const NotiDetailPage({super.key, this.cameraName, this.time});
  final String? cameraName;
  final String? time;
  @override
  State<NotiDetailPage> createState() => _NotiDetailPageState();
}

class _NotiDetailPageState extends State<NotiDetailPage> {
  bool isPlayState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.black,
                        iconSize: 30),
                    const Text(
                      'FALL DETECTED!',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 30,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 8, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.cameraName ?? 'Camera 1',
                              style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat('hh:mm:ss EEE, MMM dd, yyyy').format(
                              DateTime.parse(widget.time != null
                                  ? widget.time!
                                  : DateTime.now().toString())),
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 10,
                              color: Color(0xFFAAAAAA),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(
                                color:
                                    const Color(0xFFD8031C).withOpacity(0.97),
                                width: 1.5),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: isPlayState ? 1.0 : 0.6,
                                child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.5)),
                                    ),
                                    child: const ImageWidget(
                                      imagePath:
                                          'assets/images/living_room.jpg',
                                    )),
                              ),
                              !isPlayState
                                  ? TouchableOpacity(
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFD9D9D9)
                                                .withOpacity(0.9),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(40)),
                                            border: Border.all(
                                                color: const Color(0xFFD8031C),
                                                width: 2)),
                                        child: const Icon(
                                            Icons.play_arrow_rounded,
                                            size: 48,
                                            color: Colors.white),
                                      ),
                                      onTap: () => setState(() {
                                            isPlayState = true;
                                          }))
                                  : const SizedBox()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Danger level: ',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFAAAAAA)),
                            ),
                            Text(
                              'High',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFFF6B00)),
                            )
                          ],
                        ),
                        Text(
                          'Time: ${DateFormat('hh:mm:ss EEE, MMM dd, yyyy').format(DateTime.parse(widget.time != null ? widget.time! : DateTime.now().toString()))}',
                          style: const TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFAAAAAA)),
                        ),
                        const Text(
                          'Device: Elder-C001',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFAAAAAA)),
                        ),
                        const Text(
                          'Duration: 10 seconds',
                          style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFAAAAAA)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 8, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0xFF69EA2D),
                                  size: 6,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'LIVE',
                                  style: TextStyle(letterSpacing: 2),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // border: Border.all(
                            //     color:
                            //         const Color(0xFFD8031C).withOpacity(0.97),
                            //     width: 1.5),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                  opacity: 1,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.5)),
                                    ),
                                    child: const ImageWidget(
                                        imagePath:
                                            'assets/images/living_room.jpg'),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: TouchableOpacity(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFD8031C),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 12, bottom: 12, left: 24, right: 24),
                            child: Text(
                              'Call emergency',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        onTap: () {
                          print('Call Emergency');
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
