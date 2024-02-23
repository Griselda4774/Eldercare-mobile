import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget(
      {super.key,
      required this.cameraName,
      required this.cameraURL,
      required this.isOnline});
  final String cameraName;
  final String cameraURL;
  final bool isOnline;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  bool isOnlineState = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.cameraName,
                style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              isOnlineState
                  ? const Row(
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
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                  color: const Color(0xFF9FCBEE).withOpacity(0.97), width: 1.5),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: isOnlineState ? 1.0 : 0.6,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.5)),
                    ),
                    child: Image(
                      image: AssetImage(widget.cameraURL.toString()),
                    ),
                  ),
                ),
                !isOnlineState
                    ? TouchableOpacity(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withOpacity(0.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                  color: const Color(0xFF9FCBEE), width: 1.5)),
                          child: const Icon(Icons.play_arrow_rounded,
                              size: 48, color: Colors.white),
                        ),
                        onTap: () => setState(() {
                              isOnlineState = true;
                            }))
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
