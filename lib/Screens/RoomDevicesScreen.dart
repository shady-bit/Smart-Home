import 'package:flutter/material.dart';
import 'package:smarthome/widgets/RoomDeviceCard.dart';
import 'package:smarthome/widgets/SlideDots.dart';

import 'RoomScreen.dart';

class RoomDevicesScreen extends StatefulWidget {
  @override
  _RoomDevicesScreenState createState() => _RoomDevicesScreenState();
}

class _RoomDevicesScreenState extends State<RoomDevicesScreen> {
  int _currentPage = 3;

  final List<Widget> roomDevices = [
    RoomScreen(),
    RoomScreen(),
    RoomScreen(),
    RoomScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 24,),
                Text(
                    "Living Room",
                    style: const TextStyle(
                        color:  const Color(0xff141414),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Oxygen",
                        fontStyle:  FontStyle.normal,
                        fontSize: 24.0
                    ),
                    textAlign: TextAlign.left
                ),
                SizedBox(height: 12,),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < roomDevices.length; i++)
                        if(i == _currentPage)
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  height: 800,
//                  width: double.maxFinite,
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    pageSnapping: true,
                    children: roomDevices,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


