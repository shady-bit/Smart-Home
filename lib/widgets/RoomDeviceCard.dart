import 'package:flutter/material.dart';

class RoomDeviceCard extends StatelessWidget {
  const RoomDeviceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 110,
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
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    "Off",
                    style: const TextStyle(
                        color:  const Color(0xff141414),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        fontStyle:  FontStyle.normal,
                        fontSize: 16.0
                    ),
                    textAlign: TextAlign.left
                ),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Samsung 2-in-1 Fri…",
                      style: const TextStyle(
                          color:  const Color(0xff141414),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.0
                      ),
                      textAlign: TextAlign.left
                  ),
                  Text(
                      "Refridgerator",
                      style: const TextStyle(
                          color:  const Color(0xff707070),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontStyle:  FontStyle.normal,
                          fontSize: 10.0
                      ),
                      textAlign: TextAlign.left
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}