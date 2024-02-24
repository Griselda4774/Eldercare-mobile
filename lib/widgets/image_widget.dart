import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  ImageStream? _imageStream;
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _imageStream = AssetImage(widget.imagePath.toString())
        .resolve(ImageConfiguration.empty);
    _imageStream!.addListener(ImageStreamListener(_onImageLoad));
  }

  void _onImageLoad(ImageInfo image, bool synchronousCall) {
    setState(() {
      _isImageLoaded = true;
    });
  }

  @override
  void dispose() {
    _imageStream!.removeListener(ImageStreamListener(_onImageLoad));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isImageLoaded
        ? Image.asset(
            widget.imagePath.toString(),
          ) // Use the image now that it's loaded
        : const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
  }
}
