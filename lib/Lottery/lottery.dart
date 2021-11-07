import 'dart:async';
import 'dart:math';
import 'package:addictify/Main/curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:addictify/Model/l_user.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';


class LotteryPage extends StatefulWidget {
  const LotteryPage({Key key}) : super(key: key);

  @override
  _LotteryState createState() => _LotteryState();

}
class _LotteryState extends State<LotteryPage> {

  @override
  void initState() {
    super.initState();
  }

  Widget dailyWidget(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      color:  Colors.orangeAccent,
      child: SizedBox (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.85,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Daily",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/gc.png",height: 200, width: 200),
                ),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("\$5 Amazon Gift Card",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                )
                            ),
                          )
                      ),
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("\$5 Amazon gift card if you want to earn some quick cash!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                )
                            ),
                          )
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: SlideCountdownClock(
                            duration: Duration(days: 30),
                            slideDirection: SlideDirection.Down,
                            separator: ":",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 75,
                            child: ElevatedButton(child: Text('10 Coins', textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.bold),), onPressed: () {},  style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color> (Colors.greenAccent), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            ),
                            ),
                          )
                      ),
                    ],
                  ),
                )),
              ],
            ), // Add your child here
          ],
        ),
      ),
    );
  }

  Widget weeklyWidget(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      color:  Colors.orangeAccent,
      child: SizedBox (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.85,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Weekly",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/gc2.png",height: 200, width: 200),
                ),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("\$20 Amazon Gift Card",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                )
                            ),
                          )
                      ),
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("Win this amazing \$20 Amazon gift card! Now we're really talking!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                )
                            ),
                          )
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: SlideCountdownClock(
                            duration: Duration(days: 30),
                            slideDirection: SlideDirection.Down,
                            separator: ":",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 75,
                            child: ElevatedButton(child: Text('50 Coins', textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.bold),), onPressed: () {},  style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color> (Colors.greenAccent), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            ),
                            ),
                          )
                      ),
                    ],
                  ),
                )),
              ],
            ), // Add your child here
          ],
        ),
      ),
    );
  }

  Widget monthlyWidget(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      color:  Colors.orangeAccent,
      child: SizedBox (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.85,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Monthly",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/gc3.png",height: 200, width: 200),
                ),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("\$75 Amazon Gift Card",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20
                                )
                            ),
                          )
                      ),
                      Align(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text("Win this amazing \$75 Amazon gift card with all the hard earned days of not smoking!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                )
                            ),
                          )
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: SlideCountdownClock(
                            duration: Duration(days: 30),
                            slideDirection: SlideDirection.Down,
                            separator: ":",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            height: 75,
                            child: ElevatedButton(child: Text('200 Coins', textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.bold),), onPressed: () {},  style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color> (Colors.greenAccent), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            ),
                            ),
                          )
                      ),
                    ],
                  ),
                )),
              ],
            ), // Add your child here
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white30,
        body: Stack(
            children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end:
                      Alignment.bottomCenter, // 10% of the width, so there are ten blinds.
                      colors: <Color>[
                        Colors.lightBlue,
                        Colors.lightBlueAccent,
                        Colors.greenAccent
                      ], // red to yellow
                      tileMode: TileMode.clamp, // repeats the gradient over the canvas
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text("Rewards",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Segoe',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Stack(children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 35,
                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                              child: Image.asset(
                                                "assets/images/coin_1.png",
                                                height: 40,
                                                width: 40,
                                              ),
                                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0)
                                          ),
                                          Padding(
                                            child: Text("123",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Segoe',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20)),
                                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: new BorderRadius.circular(20),
                                        color: Color(0xFF4A4949),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverPadding(
                        padding: const EdgeInsets.all(20),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    if (index == 0) {
                                      return dailyWidget(context);
                                    } else if (index == 1) {
                                      return weeklyWidget(context);
                                    }
                                return monthlyWidget(context);
                              },
                              childCount: 3
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ]
        )
    );

  }
}