import 'package:addictify/CameraManager/cameramanager.dart';
import 'package:addictify/Main/main_page.dart';
import 'package:flutter/material.dart';
import 'Login/login.dart';
import 'Model/l_user.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'globals.dart' as globals;

class AddictifyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainState();
  }
}

class _MainState extends State<AddictifyApp> {
  @override
  void initState() {

    super.initState();
    globals.blueCircle = new Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
              center: Alignment.bottomRight,
              radius: 1,
              colors: [Color(0xFF00D8F8), Color(0xFF00A8FE), Color(0XFF0086FE)],
              stops: [0, 0.5, 1]
          )
      ),
    );
    globals.tealCircle = new Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1,
              colors: [Color(0xFF00D4FD), Color(0xFF00E7E8), Color(0XFF00FBD3)],
              stops: [0, 0.7, 1]
          )
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/main': (context) => MainPage(currentUser: LUser(uid: "12121212", name: "Liam", email: "test@gmail.com", coins: 12)),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/camera': (context) => const CameraManager(),
      },
    );
  }

}

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(AddictifyApp());
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');