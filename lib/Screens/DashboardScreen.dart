import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/Screens/settingScreen.dart';
import 'package:smarthome/Screens/thunderScreen.dart';
import 'package:smarthome/widgets/MySlider.dart';
import 'package:smarthome/widgets/referigeratorTabs.dart';
import 'package:smarthome/widgets/weatherSlider.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = ScrollController();
  final _roomController = ScrollController();
  bool _switchVal = false;
  bool _routerVal = false;
  bool _refrigeratorVal = false;
  double _sliderVal = 0;
  int currentRoomIndex = 0;
  bool _change = false;
  bool refriBlur = false;
  bool hoverTubelight = false;
  bool routerBlur = false;
  var indicateIt;
  var showBlur = false;
  var blurContainer;

  final List<Widget> _bottomChildren = [
    thunderScreen(),
    DashboardScreen(),
    settingScreen(),
  ];

  final List<String> _roomSlider = [
    "Living Room",
    "Kitchen Room",
    "Dinning Room",
    "Bedroom",
    "TV Room",
    "Play Room",
    "Stay Room"
  ];

  List currentAppliances = [
    {
      "title": "Tubelights",
      "graphic": "assets/icons/greenhouse.png",
      "status": false,
      "key": LabeledGlobalKey("Tubelights"),
    },
    {
      "title": "Router",
      "graphic": "assets/icons/drawable-xhdpi/wireless-router.png",
      "status": false,
      "key": LabeledGlobalKey("Router"),
    },
    {
      "title": "Refridgerator",
      "graphic": "assets/icons/drawable-xhdpi/outline.png",
      "status": false,
      "key": LabeledGlobalKey("Refridgerator"),
    },
  ];

  List deviceStatus = [
    "device"
  ];

  handleBlur(key, index) {
    var actionKey = currentAppliances[index]["key"];
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    var height = renderBox.size.height;
    var width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    var xPosition = offset.dx;
    var yPosition = offset.dy;
    print(height);
    setState(() {
      blurContainer = {
        "width": width*1.1,
        "height": height*1.1,
        "origHeight": height,
        "origWidth": width,
        "origXPos": xPosition,
        "origYPos": yPosition - 25,
        "xPos": xPosition - 5,
        "yPos": yPosition - 25,
        "index": index
      };
      showBlur = true;
      indicateIt = index;
      print(indicateIt);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff7f7f7),
          body: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 35, 0),
                      height: size.height * 0.20,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 6,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35))),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("2 Jul, 2019",
                                        style: const TextStyle(
                                            color: const Color(0xff707070),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Assistant",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.0),
                                        textAlign: TextAlign.left),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4),
                                    ),
                                    Text("Cloudy",
                                        style: const TextStyle(
                                            color: const Color(0xff141414),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Inter",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                                Image.asset(
                                  "assets/icons/drawable-xhdpi/sun.png",
                                  height: 38.6,
                                  width: 38.6,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FadingEdgeScrollView.fromSingleChildScrollView(
                            child: SingleChildScrollView(
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  weatherSlider(
                                    subtitle: "Indoor Temperature",
                                    value: "26C°",
                                  ),
                                  weatherSlider(
                                    subtitle: "OutDoor Humidity",
                                    value: "58%",
                                  ),
                                  weatherSlider(
                                    subtitle: "Indoor Humidity",
                                    value: "42%",
                                  ),
                                  weatherSlider(
                                    subtitle: "OutDoor Temperature",
                                    value: "30C°",
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: FadingEdgeScrollView.fromSingleChildScrollView(
                        gradientFractionOnStart: 0,
                        gradientFractionOnEnd: 0.8,
                        child: SingleChildScrollView(
                          controller: _roomController,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: _roomSlider
                                .map(
                                  (e) =>
                                  Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                currentRoomIndex =
                                                    _roomSlider.indexOf(e);
                                                _change = !_change;
                                                print(currentRoomIndex);
                                              });
                                              print(currentRoomIndex);
                                            },
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text(e,
                                                  style: TextStyle(
                                                      color: currentRoomIndex !=
                                                          _roomSlider.indexOf(e)
                                                          ? Color(0xffa8a7a7)
                                                          : Color(0xff5232d9),
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontFamily: "Inter",
                                                      fontStyle: FontStyle
                                                          .normal,
                                                      fontSize: 11.0),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              height: 2,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(30),
                                                color: currentRoomIndex !=
                                                    _roomSlider.indexOf(e)
                                                    ? Color(0xfff7f7f7)
                                                    : Color(0xff5232d9),
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                            ).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    GestureDetector(
                                      onLongPress: () {
                                        handleBlur(
                                            currentAppliances[0]["key"], 0);
                                      },
                                      child: AnimatedContainer(
                                        key: currentAppliances[0]["key"],
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                        width: 150,
                                        height: 132,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            gradient: currentAppliances[0]["status"] ?
                                            LinearGradient(
                                                begin: Alignment(
                                                    0.5456527471542358, 1),
                                                end: Alignment(
                                                    0.5481602549552917, 0),
                                                colors: [
                                                  const Color(0xff5232d9),
                                                  const Color(0xff7e62f4)
                                                ]
                                            ) :
                                            LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Colors.white
                                                ]
                                            )
                                        ),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      currentAppliances[0]["graphic"],
                                                      height: 41.5,
                                                      width: 41.5,
                                                      color: currentAppliances[0]["status"] ? Colors
                                                          .white : Colors.black,
                                                    ),
                                                    Switch(
                                                      activeColor: Colors.white,
                                                      value: currentAppliances[0]["status"],
                                                      onChanged: (bool val) {
                                                        setState(() {
                                                          currentAppliances[0]["status"] = val;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                    currentAppliances[0]["title"],
                                                    style: TextStyle(
                                                        color: currentAppliances[0]["status"]
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        fontSize: 12.0
                                                    ),
                                                    textAlign: TextAlign.left
                                                ),
                                                Text(
                                                    currentAppliances[0]["status"]
                                                        ? "On"
                                                        : "Off",
                                                    style: TextStyle(
                                                        color: currentAppliances[0]["status"]
                                                            ? Colors.white
                                                            : Colors.grey,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontFamily: "Inter",
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        fontSize: 10.0
                                                    ),
                                                    textAlign: TextAlign.left
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                    ),
                                    //Tube Light Over
                                    SizedBox(
                                      height: 17,
                                    ),

                                    //Router Starts Here
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: routerBlur ? 4 : 0,
                                          sigmaY: routerBlur ? 4 : 0
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          handleBlur(
                                              currentAppliances[1]["key"], 1);
                                        },
                                        onLongPress: () {
                                          handleBlur(
                                              currentAppliances[1]["key"], 1);
                                        },
                                        child: Container(
                                          key: currentAppliances[1]["key"],
                                          child: AnimatedContainer(
                                            duration:
                                            Duration(milliseconds: 500),
                                            curve: Curves.easeIn,
                                            width: 150,
                                            height: 132,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.all(Radius
                                                    .circular(20)),
                                                gradient: !currentAppliances[1]["status"]
                                                    ? LinearGradient(
                                                    begin: Alignment(
                                                        0.5456527471542358,
                                                        1),
                                                    end: Alignment(
                                                        0.5481602549552917, 0),
                                                    colors: [
                                                      Colors.white,
                                                      Colors.white
                                                    ])
                                                    : LinearGradient(
                                                    begin: Alignment(
                                                        0.5456527471542358, 1),
                                                    end: Alignment(
                                                        0.5481602549552917, 0),
                                                    colors: [
                                                      const Color(0xff5232d9),
                                                      const Color(0xff7e62f4)
                                                    ])),
                                            child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: <Widget>[
                                                        Image.asset(
                                                          currentAppliances[1]["graphic"],
                                                          height: 29,
                                                          width: 27.2,
                                                          color: !currentAppliances[1]["status"]
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                        Switch(
                                                          activeColor:
                                                          Colors.white,
                                                          value: currentAppliances[1]["status"],
                                                          onChanged:
                                                              (bool val) {
                                                            setState(() {
                                                              currentAppliances[1]["status"] =
                                                                  val;
                                                            });
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Text(
                                                        currentAppliances[1]["title"],
                                                        style: TextStyle(
                                                            color: !currentAppliances[1]["status"]
                                                                ? Colors.black
                                                                : Colors.white,
                                                            fontWeight: FontWeight
                                                                .w700,
                                                            fontFamily: "Inter",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 12.0),
                                                        textAlign: TextAlign
                                                            .left),
                                                    Text(
                                                        currentAppliances[1]["status"]
                                                            ? "on"
                                                            : "off",
                                                        style: TextStyle(
                                                            color: !_routerVal
                                                                ? Colors.grey
                                                                : Colors.white,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                            fontFamily: "Inter",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 10.0),
                                                        textAlign: TextAlign
                                                            .left),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                    //Router Ends
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 26,
                              ),

                              //Refrigerator Starts
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: refriBlur ? 4 : 0,
                                          sigmaY: refriBlur ? 4 : 0
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                        Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                        width: 145,
                                        height: 278,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            gradient: !currentAppliances[2]["status"] ? LinearGradient(
                                                  begin: Alignment(0.5456527471542358, 1),
                                                  end: Alignment(0.5481602549552917, 0),
                                                  colors: [
                                                  Colors.white,
                                                  Colors.white
                                                  ]) : LinearGradient(
                                                  begin: Alignment(0.5456527471542358, 1),
                                                  end: Alignment(0.5481602549552917, 0),
                                                  colors: [
                                                  const Color(0xff5232d9),
                                                  const Color(0xff7e62f4)
                                                  ])),
                                        child: GestureDetector(
                                          onLongPress: () {
                                            handleBlur(
                                                currentAppliances[2]["key"], 2);
                                          },
                                          child: Container(
                                              key: currentAppliances[2]["key"],
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        currentAppliances[2]["graphic"],
                                                        height: 46,
                                                        width: 23,
                                                        color: currentAppliances[2]["status"]
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                      Switch(
                                                        activeColor: Colors
                                                            .white,
                                                        value: currentAppliances[2]["status"],
                                                        onChanged: (bool val) {
                                                          setState(() {
                                                            currentAppliances[2]["status"] =
                                                                val;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 24),
                                                  Text(
                                                      currentAppliances[2]["title"],
                                                      style: TextStyle(color:
                                                      currentAppliances[2]["status"] ? Colors
                                                          .white : Colors.black,
                                                          fontWeight: FontWeight
                                                              .w700,
                                                          fontFamily: "Inter",
                                                          fontStyle: FontStyle
                                                              .normal,
                                                          fontSize: 12.0),
                                                      textAlign: TextAlign
                                                          .left),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                      _refrigeratorVal
                                                          ? "on"
                                                          : "off",
                                                      style: TextStyle(
                                                          color: _refrigeratorVal
                                                              ? Colors.white
                                                              : Colors.grey,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          fontFamily: "Inter",
                                                          fontStyle:
                                                          FontStyle.normal,
                                                          fontSize: 10.0),
                                                      textAlign: TextAlign
                                                          .left),
                                                  SizedBox(
                                                    height: 21,
                                                  ),
                                                  referigeratorTabs(
                                                    refriState:
                                                    currentAppliances[2]["status"],
                                                    heading: "Cool",
                                                    subHead: "Mode",
                                                  ),
                                                  referigeratorTabs(
                                                    refriState:
                                                    currentAppliances[2]["status"],
                                                    heading: "Yesterday",
                                                    subHead:
                                                    "Last Veggies Order",
                                                  ),
                                                  referigeratorTabs(
                                                    refriState:
                                                    currentAppliances[2]["status"],
                                                    heading: "5 July",
                                                    subHead:
                                                    "Estimated Veggies Duration",
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                    //Refrigerator Ends Here
                                  ],
                                ),
                              )

                              //Refrigerator Ends

                            ],
                          ),
                          SizedBox(
                            height: 34,
                          ),

                          //Temperature and Slider
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 37, 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Temperature",
                                            style: const TextStyle(
                                                color: const Color(0xff141414),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Inter",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13.0),
                                            textAlign: TextAlign.left),
                                        Text(
                                            "Slide along to modify A/C Temperature",
                                            style: const TextStyle(
                                                color: const Color(0xff707070),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Inter",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10.0),
                                            textAlign: TextAlign.left),
                                      ],
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              style: const TextStyle(
                                                  color: const Color(
                                                      0xff141414),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Oxygen",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 25.0),
                                              text: "20°"),
                                          TextSpan(
                                              style: const TextStyle(
                                                  color: const Color(
                                                      0xff141414),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Oxygen",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 25.0),
                                              text: "C"),
                                        ]))
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    MySlider(
                                      height: 40,
                                      width: size.width - 130,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              showBlur ?
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBlur = false;
                    blurContainer = null;
                    indicateIt = null;
                  });
                },
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: showBlur ? 4 : 0,
                        sigmaY: showBlur ? 4 : 0
                    ),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ) :
              Container(),
              blurContainer != null ?
              Positioned(
                  left: blurContainer["xPos"],
                  top: blurContainer["yPos"],
                  child: indicateIt == 2 ?
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    height: showBlur ? blurContainer["height"] : 0,
                    width: showBlur ? blurContainer["width"] : 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: !currentAppliances[indicateIt]["status"] ? LinearGradient(
                            begin: Alignment(0.5456527471542358, 1),
                            end: Alignment(0.5481602549552917, 0),
                            colors: [
                              Colors.white,
                              Colors.white
                            ])
                            : LinearGradient(
                            begin: Alignment(0.5456527471542358, 1),
                            end: Alignment(0.5481602549552917, 0),
                            colors: [
                              const Color(0xff5232d9),
                              const Color(0xff7e62f4)
                            ])),
                    child: GestureDetector(
//                      onLongPress: () {
//                        handleBlur(currentAppliances[2]["key"], 2);
//                      },
                      child: Container(
//                          key: blurContainer["index"][],
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    currentAppliances[indicateIt]["graphic"],
                                    height: 46,
                                    width: 23,
                                    color: currentAppliances[indicateIt]["status"]
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Switch(
                                    activeColor: Colors.white,
                                    value: currentAppliances[indicateIt]["status"],
                                    onChanged: (bool val) {
                                      setState(() {
                                        currentAppliances[indicateIt]["status"] = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              Text(currentAppliances[indicateIt]["title"],
                                  style: TextStyle(color: currentAppliances[indicateIt]["status"] ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Inter",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 3,
                              ),
                              Text(currentAppliances[indicateIt]["status"] ? "on" : "off",
                                  style: TextStyle(
                                      color: currentAppliances[1]["status"]
                                          ? Colors.white
                                          : Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      fontStyle:
                                      FontStyle.normal,
                                      fontSize: 10.0),
                                  textAlign: TextAlign.left),
                              SizedBox(
                                height: 21,
                              ),
                              referigeratorTabs(
                                refriState: currentAppliances[indicateIt]["status"],
                                heading: "Cool",
                                subHead: "Mode",
                              ),
                              referigeratorTabs(
                                refriState: currentAppliances[indicateIt]["status"],
                                heading: "Yesterday",
                                subHead:
                                "Last Veggies Order",
                              ),
                              referigeratorTabs(
                                refriState: currentAppliances[indicateIt]["status"],
                                heading: "5 July",
                                subHead:
                                "Estimated Veggies Duration",
                              ),
                            ],
                          )),
                    ),
                  ) :
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    height: showBlur ? blurContainer["height"] : 0,
                    width: showBlur ? blurContainer["width"] : 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)),
                        gradient: currentAppliances[indicateIt]["status"] ?
                        LinearGradient(
                            begin: Alignment(
                                0.5456527471542358, 1),
                            end: Alignment(
                                0.5481602549552917, 0),
                            colors: [
                              const Color(0xff5232d9),
                              const Color(0xff7e62f4)
                            ]
                        ) :
                        LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white
                            ]
                        )
                    ),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  currentAppliances[indicateIt]["graphic"],
                                  height: 41.5,
                                  width: 41.5,
                                  color: currentAppliances[indicateIt]["status"] ? Colors
                                      .white : Colors.black,
                                ),
                                Switch(
                                  activeColor: Colors.white,
                                  value: currentAppliances[indicateIt]["status"],
                                  onChanged: (bool val) {
                                    setState(() {
                                      currentAppliances[indicateIt]["status"] = val;
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                                currentAppliances[indicateIt]["title"],
                                style: TextStyle(
                                    color: currentAppliances[indicateIt]["status"]
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight
                                        .w700,
                                    fontFamily: "Inter",
                                    fontStyle: FontStyle
                                        .normal,
                                    fontSize: 12.0
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text(
                                currentAppliances[indicateIt]["status"]
                                    ? "On"
                                    : "Off",
                                style: TextStyle(
                                    color: currentAppliances[indicateIt]["status"]
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight
                                        .w500,
                                    fontFamily: "Inter",
                                    fontStyle: FontStyle
                                        .normal,
                                    fontSize: 10.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        )
                    ),
                  ),
              ): Container()
            ]
          ),
        )
    );
  }
}
