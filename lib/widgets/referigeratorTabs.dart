import 'package:flutter/material.dart';

class referigeratorTabs extends StatelessWidget {
  final String heading;
  final String subHead;
  final bool refriState;
  const referigeratorTabs({
    Key key,
    this.heading,
    this.subHead,
    this.refriState
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          height: 34,
          width: 129,
          decoration:  BoxDecoration(
              color: const Color(0x1affffff),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icons/drawable-xhdpi/snow.png",height: 17.5,width: 16.6,color: !refriState ? Colors.black : Colors.white,),
              Padding(padding: EdgeInsets.only(right: 8),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "$heading",
                      style: TextStyle(
                          color:  !refriState ? Colors.black:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Oxygen",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.0
                      ),
                      textAlign: TextAlign.left
                  ),
                  Padding(padding: EdgeInsets.only(top: 3),),
                  Text(
                      "$subHead",
                      style: TextStyle(
                          color:  !refriState ? Colors.grey[400]:Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Inter",
                          fontStyle:  FontStyle.normal,
                          fontSize: 7.0
                      ),
                      textAlign: TextAlign.left
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 8,)
      ],
    );
  }
}

