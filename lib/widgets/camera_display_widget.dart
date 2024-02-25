import 'dart:async';
import 'package:eldercare/widgets/warning_alert.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CameraDisplayWidget extends StatefulWidget {
  const CameraDisplayWidget({super.key, this.showWarning});

  final void showWarning;

  @override
  State<CameraDisplayWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<CameraDisplayWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/fall_source.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoPlayerController.play();
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController.value.isInitialized) {
      Timer(const Duration(milliseconds: 4500), () {
        showDialog(
            context: context,
            builder: (_) => const WarningAlert(cameraName: 'Living Room'),
            barrierDismissible: false);
      });
    }

    return Container(
      child: _videoPlayerController.value.isInitialized
          ? Stack(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ],
            )
          : Container(),
    );
  }
}
