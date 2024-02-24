import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayerWidget extends StatefulWidget {
  const ChewieVideoPlayerWidget({super.key, required this.isPlay});
  final bool isPlay;

  @override
  State<ChewieVideoPlayerWidget> createState() =>
      _ChewieVideoPlayerWidgetState();
}

class _ChewieVideoPlayerWidgetState extends State<ChewieVideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  bool isPlayState = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isPlayState = widget.isPlay;
    });
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/test_video.mp4');
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: isPlayState,
      looping: true,
      showControls: false,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: chewieController != null
            ? Chewie(controller: chewieController!)
            : const CircularProgressIndicator());
  }
}
