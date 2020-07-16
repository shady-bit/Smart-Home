import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarthome/widgets/RoomCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          primary: false,
          title: Text("Smart Home",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: const Color(0xff7e62f4),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("4"),
                  ),
                ),
              ),
            )
          ],
          leading: Icon(Icons.menu,color: const Color(0xff7e62f4),),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(
                      "Your home \n is now unsecured!",
                      style: const TextStyle(
                      color:  const Color(0xff141414),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontStyle:  FontStyle.normal,
                        fontSize: 25.0
                    ),
                      textAlign: TextAlign.left
                  ),
                  Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0x80ea4f4f)
                      ),
                      child: Container(
                        height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage("assets/icons/lock.png"),
                              fit: BoxFit.cover
                            )
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                  width: size.width - 30,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                          color: const Color(0xff7e62f4),
                          offset: Offset(0,0),
                          blurRadius: 6,
                          spreadRadius: 0
                      )] ,
                      color: const Color(0xff7e62f4)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("assets/icons/drawable-xhdpi/thunder.png",height: 27,width: 14,),
                            SizedBox(width: 7.1,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "275kW",
                                    style: const TextStyle(
                                        color:  const Color(0xfff0f0f0),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Text(
                                    "Power Usage",
                                    style: const TextStyle(
                                        color:  const Color(0xffe3e3e3),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Assistant",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.0
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("assets/icons/drawable-xhdpi/bill.png",height: 27,width: 20,),
                            SizedBox(width: 7.1,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "275kW",
                                    style: const TextStyle(
                                        color:  const Color(0xfff0f0f0),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Text(
                                    "Power Usage",
                                    style: const TextStyle(
                                        color:  const Color(0xffe3e3e3),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Assistant",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.0
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("assets/icons/drawable-xhdpi/key.png",height: 20,width: 20,),
                            SizedBox(width: 7.1,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "275kW",
                                    style: const TextStyle(
                                        color:  const Color(0xfff0f0f0),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Inter",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Text(
                                    "Power Usage",
                                    style: const TextStyle(
                                        color:  const Color(0xffe3e3e3),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Assistant",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.0
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 23,),
              Row(
                children: <Widget>[
                  Text(
                      "Rooms",
                      style: const TextStyle(
                          color:  const Color(0xff141414),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.0
                      ),
                      textAlign: TextAlign.left
                  ),
                  SizedBox(width: 8,),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: const Color(0xff7e62f4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    child: Center(
                      child: Text("4",style:  TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Wrap(
//                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                direction: Axis.horizontal,
                children: <Widget>[
                  RoomCard(
                    image: "assets/icons/drawable-xhdpi/outline.png",
                    roomName: "Kitchen",
                    consumption: 27.56,
                  ),
                  RoomCard(
                    image: "assets/icons/drawable-xhdpi/sofa.png",
                    roomName: "Living Room",
                    consumption: 27.56,
                  ),
                  RoomCard(
                    image: "assets/icons/drawable-xhdpi/bathroom.png",
                    roomName: "Bathroom",
                    consumption: 27.56,
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Text(
                  "Automation",
                  style: const TextStyle(
                      color:  const Color(0xff141414),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      fontStyle:  FontStyle.normal,
                      fontSize: 14.0
                  ),
                  textAlign: TextAlign.left
              ),
              SizedBox(height: 8,),
              Row(
                children: <Widget>[
                  Container(
                      width: 110,
                      height: 95,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                          )] ,
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff7e62f4)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset("assets/icons/drawable-xhdpi/moon.png",height: 19,width: 19,),
                              SizedBox(height: 20,),
                              Text(
                                  "Night Mode",
                                  style: const TextStyle(
                                      color:  const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Inter",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 11.0
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 15,),
                  Container(
                      width: 110,
                      height: 95,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0,3),
                              blurRadius: 6,
                              spreadRadius: 0
                          )] ,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset("assets/icons/drawable-xhdpi/green-energy.png",height: 20,width: 20,),
                              SizedBox(height: 20,),
                            Text(
                                "Power Save \n Mode",
                            style: const TextStyle(
                            color:  const Color(0xff141414),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            fontStyle:  FontStyle.normal,
                            fontSize: 11.0
                            ),
                          textAlign: TextAlign.left
                            )
                            ],
                          ),
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

