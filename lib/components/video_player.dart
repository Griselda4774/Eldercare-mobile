import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:eldercare/components/clock_running.dart';
import 'package:eldercare/components/warning_alert.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.cameraName});
  final String cameraName;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/source.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoPlayerController.play();
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    // if (_videoPlayerController.value.isInitialized) {
    //   Timer(const Duration(seconds: 3), () {
    //     showDialog(
    //         context: context,
    //         builder: (_) => const WarningAlert(cameraName: 'Camera 1'),
    //         barrierDismissible: false);
    //   });
    // }
    return Container(
      child: _videoPlayerController.value.isInitialized
          ? Stack(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Text(
                            super.widget.cameraName.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Colors.black),
                          ),
                          Text(
                            super.widget.cameraName.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const ClockRunning()
                    ],
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
