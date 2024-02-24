import 'package:eldercare/widgets/camera_widget.dart';
import 'package:eldercare/widgets/touchableopacity.dart';
import 'package:flutter/material.dart';

class NotiDetailPage extends StatefulWidget {
  const NotiDetailPage({super.key});

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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Living Room',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
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
                                    child: Image.asset(
                                      'assets/images/living_room.jpg',
                                      fit: BoxFit.cover,
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
                                  opacity: 1,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.5)),
                                    ),
                                    child: Image.asset(
                                      'assets/images/living_room.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
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
