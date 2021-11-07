import 'dart:async';
import 'dart:math';
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
              borderRadius: BorderRadius.circular(50)),
          color:  Colors.black,
          child: SizedBox (
            width: MediaQuery.of(context).size.width * .75,
            height: MediaQuery.of(context).size.height /2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text("Daily",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Segoe',
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
                  child: SlideCountdownClock(
                    duration: Duration(days: 1),
                    slideDirection: SlideDirection.Down,
                    separator: ":",
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(child: Text('Enter Now!'),onPressed: () {},  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color> (Colors.orange), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          ),
                      ),
                  ),
            ),
                ),// Add your child here
        ],
      ),
          ),
      );
    }

  Widget weeklyWidget(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)),
      color:  Colors.black,
      child: SizedBox (
        width: MediaQuery.of(context).size.width * .75,
        height: MediaQuery.of(context).size.height /2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text("Weekly",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
              child: SlideCountdownClock(
                duration: Duration(days: 7),
                slideDirection: SlideDirection.Down,
                separator: ":",
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/gc2.png"),

            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(child: Text('Enter Now!'),onPressed: () {},  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color> (Colors.orange), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
              ),
              ),
              ),
            ),// Add your child here
          ],
        ),
      ),
    );
  }

  Widget monthlyWidget(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)),
      color:  Colors.black,
      child: SizedBox (
        width: MediaQuery.of(context).size.width * .75,
        height: MediaQuery.of(context).size.height /2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text("Monthly",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
            ),
            Align(
              alignment: Alignment. topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
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
              child: ElevatedButton(child: Text('Enter Now!'),onPressed: () {},  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color> (Colors.orange), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                ),
              ),
              ),
              ),
            ),// Add your child here
          ],
        ),
      ),
    );
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
            color: Colors.black54,
            child: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 60, 0, 0),
                                    child: Text(
                                      "Raffles 🎉",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Segoe',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                      ),
                                    ),
                                    ),
                                ],
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return dailyWidget(context);
                    },
                    childCount: 1,
                  ),
                ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return weeklyWidget(context);
                      },
                      childCount: 1,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return monthlyWidget(context);
                      },
                      childCount: 1,
                    ),
                  ),
              ],
             ),
            )
          )
      );
    }
  }