
import 'package:addictify/CameraManager/cameramanager.dart';
import 'package:addictify/Model/l_user.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';
import 'curve_clipper.dart';

class MainPage extends StatefulWidget {
  final LUser currentUser;

  const MainPage({Key key, this.currentUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainPage>
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


  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);
  double barWidthMn = 15;
  double barWidthTe = 15;
  double barWidthWe = 15;
  double barWidthTu = 15;
  double barWidthFr = 15;
  double barWidthSt = 15;
  double barWidthSn = 15;

  var unselected = [Colors.lightBlueAccent, Colors.greenAccent];
  var selected = [Colors.yellowAccent, Colors.lightBlueAccent];

  var mnColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var teColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var wdColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var tuColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var frColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var stColors = [Colors.lightBlueAccent, Colors.greenAccent];
  var snColors = [Colors.lightBlueAccent, Colors.greenAccent];


  DateTime _selectedValue = DateTime.now();

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  int touchedIndex = -1;

  bool isPlaying = false;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  TextField emailTextField;
  TextField passwordTextField;

  @override
  void initState() {
    super.initState();
    _slide0Controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _slide0Animation = Tween<Offset>(
      begin: Offset(0, 5.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slide0Controller,
      curve: Curves.easeInOut,
    ));
    _slide1Controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _slide1Animation = Tween<Offset>(
      begin: Offset(0, 5.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slide1Controller,
      curve: Curves.easeInOut,
    ));
    _slide2Controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _slide2Animation = Tween<Offset>(
      begin: Offset(0, 6.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slide2Controller,
      curve: Curves.easeInOut,
    ));
    _slide3Controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _slide3Animation = Tween<Offset>(
      begin: Offset(0, 6.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slide3Controller,
      curve: Curves.easeInOut,
    ));
    _slide4Controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _slide4Animation = Tween<Offset>(
      begin: Offset(0, 6.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slide4Controller,
      curve: Curves.easeInOut,
    ));

    _fade0Controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fade0Animation = CurvedAnimation(
      parent: _fade0Controller,
      curve: Curves.easeIn,
    );
    _fade1Controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fade1Animation = CurvedAnimation(
      parent: _fade1Controller,
      curve: Curves.easeIn,
    );
    _fade2Controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fade2Animation = CurvedAnimation(
      parent: _fade2Controller,
      curve: Curves.easeIn,
    );
    _fade3Controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fade3Animation = CurvedAnimation(
      parent: _fade3Controller,
      curve: Curves.easeIn,
    );
    _fade4Controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _fade4Animation = CurvedAnimation(
      parent: _fade4Controller,
      curve: Curves.easeIn,
    );

    _fade0Controller.forward().then((value) {
      _fade1Controller.forward().then((value) {
        _fade2Controller.forward().then((value) {
          _fade3Controller.forward().then((value) {
            _fade4Controller.forward();
          });
        });
      });
    });

    _slide0Controller.forward().then((value) {
      _slide1Controller.forward().then((value) {
        _slide2Controller.forward().then((value) {
          _slide3Controller.forward().then((value) {
            _slide4Controller.forward();
          });
        });
      });
    });
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }


  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: const EdgeInsets.all(0),
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.y.round().toString(),
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      margin: 20,
      getTitles: (double value) {
        switch (value.toInt()) {
          case 0:
            return 'Mn';
          case 1:
            return 'Te';
          case 2:
            return 'Wd';
          case 3:
            return 'Tu';
          case 4:
            return 'Fr';
          case 5:
            return 'St';
          case 6:
            return 'Sn';
          default:
            return '';
        }
      },
    ),
    leftTitles: SideTitles(showTitles: false),
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(showTitles: false),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
            y: 8, colors: mnColors, width: barWidthMn)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
            y: 10, colors: teColors, width: barWidthTe)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
            y: 14, colors: wdColors, width: barWidthWe)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
            y: 15, colors: tuColors, width: barWidthTu)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
            y: 13, colors: frColors, width: barWidthFr)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
            y: 10, colors: stColors, width: barWidthSt)
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
            y: 10, colors: snColors, width: barWidthSn)
      ],
      showingTooltipIndicators: [0],
    ),
  ];

  Widget topBarWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Welcome " + widget.currentUser.name,
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
                          height: 30,
                          width: 30,
                        ),
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0)
                    ),
                    Padding(
                      child: Text("123",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    Padding(
                      child: Image.asset(
                        "assets/images/AddButton.png",
                        height: 13,
                        width: 13,
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
  }

  Widget bigCircle(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 100,
        showLabels: false,
        showTicks: false,
        axisLineStyle: AxisLineStyle(
          thickness: 0.1,
          cornerStyle: CornerStyle.bothCurve,
          color: Color.fromARGB(80, 0, 169, 181),
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            value: 33, // TODO: Change this dynamically
            cornerStyle: CornerStyle.bothCurve,
            width: 0.1,
            sizeUnit: GaugeSizeUnit.factor,
            color: Colors.lightGreen,
            gradient: const SweepGradient(
              colors: <Color>[
                Colors.green,
                Colors.lightGreen,
                Colors.lightGreenAccent
              ],
            ),
          )
        ],
      )
    ]);
  }

  Widget dateWidget(BuildContext context) {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay - 1));
    return FadeTransition(
        opacity: _fade2Animation,
        child: DatePicker(
          DateTime.now(),
          width: 50,
          daysCount: 7,
          initialSelectedDate: d,
          deactivatedColor: Colors.lightGreen,
          selectionColor: Colors.greenAccent,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
            setState(() {
              _selectedValue = date;
              if (DateFormat('EEEE').format(date) == "Monday") { // Monday
                barWidthMn = 25;
                barWidthTe = 15;
                barWidthWe = 15;
                barWidthTu = 15;
                barWidthFr = 15;
                barWidthSt = 15;
                barWidthSn = 15;

                mnColors = selected;
                teColors = unselected;
                wdColors = unselected;
                tuColors = unselected;
                frColors = unselected;
                stColors = unselected;
                snColors = unselected;

              } else if (DateFormat('EEEE').format(date) == "Tuesday") { // Monday
                barWidthMn = 15;
                barWidthTe = 25;
                barWidthWe = 15;
                barWidthTu = 15;
                barWidthFr = 15;
                barWidthSt = 15;
                barWidthSn = 15;

                mnColors = unselected;
                teColors = selected;
                wdColors = unselected;
                tuColors = unselected;
                frColors = unselected;
                stColors = unselected;
                snColors = unselected;
              } else if (DateFormat('EEEE').format(date) == "Wednesday") {
                barWidthMn = 15;
                barWidthTe = 15;
                barWidthWe = 25;
                barWidthTu = 15;
                barWidthFr = 15;
                barWidthSt = 15;
                barWidthSn = 15;

                mnColors = unselected;
                teColors = unselected;
                wdColors = selected;
                tuColors = unselected;
                frColors = unselected;
                stColors = unselected;
                snColors = unselected;
              } else if (DateFormat('EEEE').format(date) == "Thursday") { // Monday
                barWidthMn = 15;
                barWidthTe = 15;
                barWidthWe = 15;
                barWidthTu = 25;
                barWidthFr = 15;
                barWidthSt = 15;
                barWidthSn = 15;

                mnColors = unselected;
                teColors = unselected;
                wdColors = unselected;
                tuColors = selected;
                frColors = unselected;
                stColors = unselected;
                snColors = unselected;
              } else if (DateFormat('EEEE').format(date) == "Friday") { // Monday
                barWidthMn = 15;
                barWidthTe = 15;
                barWidthWe = 15;
                barWidthTu = 15;
                barWidthFr = 25;
                barWidthSt = 15;
                barWidthSn = 15;

                mnColors = unselected;
                teColors = unselected;
                wdColors = unselected;
                tuColors = unselected;
                frColors = selected;
                stColors = unselected;
                snColors = unselected;
              } else if (DateFormat('EEEE').format(date) == "Saturday") { // Monday
                barWidthMn = 15;
                barWidthTe = 15;
                barWidthWe = 15;
                barWidthTu = 15;
                barWidthFr = 15;
                barWidthSt = 25;
                barWidthSn = 15;

                mnColors = unselected;
                teColors = unselected;
                wdColors = unselected;
                tuColors = unselected;
                frColors = unselected;
                stColors = selected;
                snColors = unselected;
              } else if (DateFormat('EEEE').format(date) == "Sunday") { // Monday
                barWidthMn = 15;
                barWidthTe = 15;
                barWidthWe = 15;
                barWidthTu = 15;
                barWidthFr = 15;
                barWidthSt = 15;
                barWidthSn = 25;

                mnColors = unselected;
                teColors = unselected;
                wdColors = unselected;
                tuColors = unselected;
                frColors = unselected;
                stColors = unselected;
                snColors = selected;
              }
            });
          },
        ));
  }

  Widget chartWidget(BuildContext context) {
    return FadeTransition(
      opacity: _fade3Animation,
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black12,
          child:
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Text("Daily Sessions",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          )
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: BarChart(
                            BarChartData(
                              barTouchData: barTouchData,
                              titlesData: titlesData,
                              borderData: borderData,
                              barGroups: barGroups,
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget lineWidget(BuildContext context) {
    return FadeTransition(
      opacity: _fade4Animation,
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black12,
          child:
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                      child: Text("Goal progress",
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
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: LineChart(
                              mainData(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget cardButton(LUser user) {
    return FadeTransition(
      opacity: _fade0Animation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.black,
          child: new InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CameraManager(currentUser: user)),
              );
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20), child: Image.asset("assets/images/burningcig.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add smoking session",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w600,
                              fontSize: 15)
                      ),
                      Text("Remember to find a spot outside",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white60,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w400,
                              fontSize: 12)
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget raffleButton() {
    return FadeTransition (
      opacity: _fade1Animation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.orange,
          child: new InkWell(
            onTap: () {
              print("tapped");
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter the raffle market",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w600,
                              fontSize: 15)
                      ),
                      Text("Spend your hard earned coins!",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white60,
                              fontFamily: 'Segoe',
                              fontWeight: FontWeight.w400,
                              fontSize: 12)
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
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
                height: 350.0,
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
            Container(
              child: SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                        pinned: false,
                        snap: false,
                        floating: false,
                        expandedHeight: 300.0,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: Stack(
                          children: [
                            Align(
                              child: Container(
                                width: 300,
                                height: 300,
                                child: bigCircle(context),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text("1/3\nsmoked",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Segoe',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return topBarWidget(context);
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SlideTransition(position: _slide0Animation, child: cardButton(widget.currentUser));
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SlideTransition(position: _slide1Animation, child: raffleButton());
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SlideTransition(position: _slide2Animation, child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: dateWidget(context),
                          ));
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SlideTransition(position: _slide3Animation, child: chartWidget(context));
                        },
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SlideTransition(position: _slide4Animation, child:lineWidget(context));
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
