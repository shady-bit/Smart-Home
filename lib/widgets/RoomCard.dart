import 'package:flutter/material.dart';
class RoomCard extends StatelessWidget {
  final String image;
  final String roomName;
  final double consumption;
  final Function function;
  const RoomCard({
    this.image,
    this.consumption,
    this.roomName,
    this.function,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          print("tapped");
        },
        child: Container(
          width: 110,
          height: 95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(5)
              ),
              border: Border.all(
                  color: const Color(0x407e62f4),
                  width: 1
              ),
              color: const Color(0xfffcfcff)
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(image,width: 23,height: 23,color: const Color(0xff7e62f4),),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18.7,),
                Text(
                    "$roomName",
                    style: const TextStyle(
                        color:  const Color(0xff141414),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontStyle:  FontStyle.normal,
                        fontSize: 11.0
                    ),
                    textAlign: TextAlign.left
                ),
                Row(
                  children: <Widget>[
                    Image.asset("assets/icons/drawable-xhdpi/thunder.png",height: 15,width: 15,color: const Color(0xff7e62f4),),
                    SizedBox(width: 3,),
                    Text(
                        "$consumption kW",
                        style: const TextStyle(
                            color:  const Color(0xcc141414),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            fontStyle:  FontStyle.normal,
                            fontSize: 8.0
                        ),
                        textAlign: TextAlign.left
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
