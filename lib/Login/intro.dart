import 'package:flutter/material.dart';
import 'package:addictify/Login/login.dart';
import 'package:addictify/globals.dart' as globals;

class Intro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Addictify', style: TextStyle(
          fontSize: 24,)
        )
      ),
    );
  }
}