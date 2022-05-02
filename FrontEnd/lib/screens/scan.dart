import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CameraPreview(controller),
              ),
              Positioned(
                left: 25.0,
                top: 60.0,
                child: Center(
                    child: buildBlur(
                        borderRadius: BorderRadius.circular(100),
                        child: GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: formText.withOpacity(0.3),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                padding: const EdgeInsets.only(right: 2),
                                child: const ImageIcon(
                                  AssetImage('assets/icons/back.png'),
                                  color: Colors.white,
                                ),
                              )),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ))),
              ),
              Positioned(
                right: 25.0,
                top: 60.0,
                child: Center(
                    child: buildBlur(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: formText.withOpacity(0.3),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const ImageIcon(
                      AssetImage('assets/icons/sun.png'),
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
            ],
          ),

          // Center(
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     child: CameraPreview(controller),
          //   ),
          // ),

          if (pictureFile != null)
            Image.network(
              pictureFile!.path,
              height: 200,
            )
          //Android/iOS
          // Image.file(File(pictureFile!.path)))
        ],
      ),
    );
  }

  Widget buildBlur({
    required Widget child,
    required BorderRadius borderRadius,
    double sigmaX = 10,
    double sigmaY = 10,
  }) =>
      ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}
