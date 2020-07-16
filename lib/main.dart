import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/Screens/HomeScreen.dart';
import 'package:smarthome/Screens/LoginScreen.dart';
import 'package:smarthome/Screens/OTPScreen.dart';
import 'package:smarthome/Screens/RoomDevicesScreen.dart';
import 'Navigation/BottomNavigationController.dart';
import 'Screens/DashboardScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primaryColor: Color(0xff7e62f4),
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      home: RoomDevicesScreen(),
    );
  }
}
