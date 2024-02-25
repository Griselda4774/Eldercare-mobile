import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Base64ImageWidget extends StatefulWidget {
  const Base64ImageWidget({super.key, required this.base64ImageString});
  final String base64ImageString;

  @override
  State<Base64ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<Base64ImageWidget> {
  ImageStream? _imageStream;
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _imageStream = Image.memory(
      Uint8List.fromList(
        base64.decode(widget.base64ImageString.toString()),
      ),
    ).image.resolve(ImageConfiguration.empty);
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
        ? Image.memory(base64Decode(
            widget.base64ImageString)) // Use the image now that it's loaded
        : const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
  }
}
