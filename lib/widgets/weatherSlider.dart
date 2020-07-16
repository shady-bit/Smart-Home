import 'package:flutter/cupertino.dart';

class weatherSlider extends StatelessWidget {
  final String value;
  final String subtitle;

  const weatherSlider({
    Key key,
    this.value,
    this.subtitle,
  }) : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25),
//      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$value",
              style: const TextStyle(
                  color: const Color(0xff141414),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Oxygen",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          Text("$subtitle",
            style: const TextStyle(
                color: const Color(0xff707070),
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                fontStyle: FontStyle.normal,
                fontSize: 10.0),
            textAlign: TextAlign.left,overflow: TextOverflow.fade,),
        ],
      ),
    );
  }
}