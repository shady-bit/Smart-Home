import 'package:flutter/material.dart';
import 'package:smarthome/Screens/DashboardScreen.dart';
import 'package:smarthome/Screens/settingScreen.dart';
import 'package:smarthome/Screens/thunderScreen.dart';



class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() => _BottomNavigationControllerState();
}

class _BottomNavigationControllerState extends State<BottomNavigationController> {
  int _currentIndex = 0;
  final List<Widget> _bottomChildren  = [
    DashboardScreen(),
    thunderScreen(),
    settingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomChildren[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
          [
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/sydney-opera-house.png",height: 22,width: 23,color: _currentIndex == 0 ? Color(0xff5232d9): Colors.grey,),
                title: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _currentIndex == 0 ? Color(0xff5232d9): Colors.white,
                    ),
                    height: 3,width: 3,),
                )
//                backgroundColor: Color(0xff5232d9)
            ) ,
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/lightning.png",height: 22,width: 23,color: _currentIndex == 1 ? Color(0xff5232d9): Colors.grey,),
                title: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _currentIndex == 1 ? Color(0xff5232d9): Colors.white,
                    ),
                    height: 3,width: 3,),
                )
//                backgroundColor: Color(0xff5232d9)
            ),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/settings.png",height: 22,width: 23,color: _currentIndex == 2 ? Color(0xff5232d9): Colors.grey,),
                title: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: _currentIndex == 2 ? Color(0xff5232d9): Colors.white,
                    ),
                    height: 3,width: 3,),
                )
            )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
