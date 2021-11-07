import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:addictify/Main/main_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:addictify/main.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:after_layout/after_layout.dart';
import 'package:addictify/Model/l_user.dart';

import 'circle_painter.dart';

class CameraManager extends StatefulWidget {
  final LUser currentUser;

  const CameraManager({Key key, this.currentUser}) : super(key: key);

  @override
  _CameraManagerState createState() {
    return _CameraManagerState();
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class _CameraManagerState extends State<CameraManager>
    with WidgetsBindingObserver {
  CameraController controller;
  String imagePath;
  double controllerRatio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.veryHigh);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _cameraPreviewWidget(),
            snapButton(),
          ],
        ));
  }

  Widget _cameraPreviewWidget() {
    if (controller != null && controller.value.isInitialized) {
      final size = MediaQuery.of(context).size;
      controllerRatio = controller.value.aspectRatio;
      final scale = controllerRatio * size.aspectRatio;
      return ClipRect(
        clipper: _MediaSizeClipper(size),
        child: Transform.scale(
          scale: 1 / scale,
          alignment: Alignment.topCenter,
          child: CameraPreview(controller),
        ),
      );
    } else {
      return const Text(
        'Camera not on',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }
  }

  Widget snapButton() {
    Alignment alignmentConfig =
    new Alignment(Alignment.bottomCenter.x, Alignment.bottomCenter.y - .25);
    return Align(
      alignment: alignmentConfig,
      child: RawMaterialButton(
        onPressed: onSnapButtonPressed,
        shape: CircleBorder().scale(2.0),
        child: CustomPaint(
          painter: CirclePainter(
              color: Colors.white,
              strokeWidth: 5,
              isAntialias: true,
              paintingStyle: PaintingStyle.stroke),
        ),
      ),
    );
  }

  void onSnapButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          log(imagePath);
          //controller?.dispose();
          //controller = null;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayImageToScreen(
                  imagePath: imagePath,
                  controllerRatio: controllerRatio, key: null, currentUser: widget.currentUser,
                ),
              ));
        });
        if (filePath != null) {}
        //showInSnackBar('Picture saved to $filePath');
      }
    });
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      //showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    String filePath;

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture().then((XFile file) {
        if (mounted) {
          setState(() {
            filePath = file.path;
          });
          if (file != null) print('Picture saved to ${file.path}');
        }
      });
    } on CameraException catch (e) {
      //_showCameraException(e);
      return null;
    }
    return filePath;
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
}

class DisplayImageToScreen extends StatefulWidget {
  final LUser currentUser;
  final String imagePath;
  final double controllerRatio;

  const DisplayImageToScreen({Key key, this.imagePath, this.controllerRatio, this.currentUser})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DisplayedImageScreen();
  }
}

class DisplayedImageScreen extends State<DisplayImageToScreen> with AfterLayoutMixin<DisplayImageToScreen> {
  String imagePath;
  double controllerRatio;
  bool _isLoaderVisible = true;

  @override
  void initState() {
    imagePath = widget.imagePath;
    controllerRatio = widget.controllerRatio;
    super.initState();
  }
  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    startDelay();
  }
  void startDelay() async {
    await Future.delayed(Duration(seconds: 3));
    _isLoaderVisible = false;
    showWin();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    startDelay();
    return Scaffold(
        body: LoadingOverlay(
          child: imageScreen(),
          isLoading: _isLoaderVisible,
        )
    );
  }

  Widget imageScreen() {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Transform.scale(
      scale: controllerRatio / deviceRatio,
      child: Center(
        child: AspectRatio(
          aspectRatio: controllerRatio,
          child: Image.file(new File(imagePath)),
        ),
      ),
    );
  }

  void showWin() {
    showDialog(
        context: context,
        builder: (_) => AssetGiffyDialog(
          image: new Image.asset(
            'assets/animations/checkmark-animation.gif',
            fit: BoxFit.cover,
          ),
          title: Text(
            'You earn 3 more coins!',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
          description: Text(
            'Good job!',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          entryAnimation: EntryAnimation.TOP,
          onOkButtonPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(
                    currentUser: widget.currentUser,
                  ),
                ));
          },
          onlyOkButton: true,
        )
    );
  }
}