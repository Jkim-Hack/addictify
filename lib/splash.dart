import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  AnimationController _slide0Controller;
  AnimationController _slide1Controller;
  AnimationController _slide2Controller;
  AnimationController _slide3Controller;
  AnimationController _slide4Controller;

  Animation<Offset> _slide0Animation;
  Animation<Offset> _slide1Animation;
  Animation<Offset> _slide2Animation;
  Animation<Offset> _slide3Animation;
  Animation<Offset> _slide4Animation;

  AnimationController _fade0Controller;
  Animation<double> _fade0Animation;
  AnimationController _fade1Controller;
  Animation<double> _fade1Animation;
  AnimationController _fade2Controller;
  Animation<double> _fade2Animation;
  AnimationController _fade3Controller;
  Animation<double> _fade3Animation;
  AnimationController _fade4Controller;
  Animation<double> _fade4Animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
