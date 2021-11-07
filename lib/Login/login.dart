import 'package:addictify/Main/main_page.dart';
import 'package:addictify/Model/l_user.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:addictify/globals.dart' as globals;
import 'package:addictify/services/Authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  AnimationController _textShowController;
  AnimationController _fightShowController;
  AnimationController _withShowController;
  AnimationController _showLoginController;


  Animation<double> _welcomeTextAnimation;
  Animation<double> _fightTextAnimation;
  Animation<double> _withTextAnimation;
  Animation<double> _showLoginAnimation;

  AuthService authService = new AuthService();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  TextField emailTextField;
  TextField passwordTextField;

  @override
  void initState() {
    super.initState();
    _textShowController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _showLoginController = AnimationController(duration: const Duration(milliseconds: 1000),vsync: this);
    _welcomeTextAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_textShowController);
    _showLoginAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_showLoginController);

    _fightShowController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _withShowController = AnimationController(duration: const Duration(milliseconds: 1000),vsync: this);
    _fightTextAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_fightShowController);
    _withTextAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_withShowController);

    _textShowController.forward().then((state) {
      _fightShowController.forward().then((state) {
        _withShowController.forward().then((state) {
          _showLoginController.forward();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    emailTextField = TextField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
          hintText: 'Email address',
        )
    );

    passwordTextField = TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration.collapsed(
            hintText: 'Password',
            border: InputBorder.none,
        ),
      textAlign: TextAlign.left,
    );

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent
                  ],
                )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FadeTransition(
                  opacity: _welcomeTextAnimation,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                    child: Text("Addictify",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Segoe',
                          fontWeight: FontWeight.w600,
                          fontSize: 60,
                        )),
                  ),
                ),
                Row(
                  children: [
                    FadeTransition(
                      opacity: _fightTextAnimation,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(70, 20, 5, 20),
                        child: Text("Fight addiction",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    FadeTransition(
                      opacity: _withTextAnimation,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text("with addiction.",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ],
                ),
                FadeTransition(
                  opacity: _showLoginAnimation,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 40),
                            child: Container(
                              width:  MediaQuery.of(context).size.width,
                              height:  MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Align(alignment: Alignment.centerLeft, child: Padding(padding: const EdgeInsets.fromLTRB(15, 0, 0, 0), child: emailTextField)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 40),
                            child: Container(
                              width:  MediaQuery.of(context).size.width,
                              height:  MediaQuery.of(context).size.height / 15,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(15),
                              ),
                              child: Align(alignment: Alignment.centerLeft, child: Padding(padding: const EdgeInsets.fromLTRB(15, 0, 0, 0), child: passwordTextField)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:  BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              child: FlatButton(
                                onPressed: () {
                                  //TODO: ADD AUTHENTICATION
                                  String email = emailController.text.toString().substring(0,emailController.text.toString().length-1);
                                  String password = passwordController.text.toString();/*
                                  authService.signInWithEmailAndPassword(email, password).then((firebaseUser) {
                                    if(firebaseUser != null){
                                      /*Navigator.push(
                                      context
                                      MaterialPageRoute(
                                          builder: (context) => CameraManager()),
                                    ); */
                                    } else {
                                      //TODO: ADD FAILURE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                          builder: (context) => MainPage(currentUser: LUser(uid: "12121212", name: "Liam", email: "test@gmail.com", coins: 12))));
                                    }
                                  }); */
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage(currentUser: LUser(uid: "12121212", name: "Liam", email: "test@gmail.com", coins: 12))));
                                },
                                color: Colors.white,
                                padding:
                                const EdgeInsets.fromLTRB(100, 15, 100, 15),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontFamily: 'Segoe',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.deepOrangeAccent),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    side: BorderSide(color: const Color(0x00))
                                        .scale(1)),
                              ),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
