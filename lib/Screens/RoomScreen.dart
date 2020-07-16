import 'package:flutter/material.dart';
import 'package:smarthome/widgets/RoomDeviceCard.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: <Widget>[
            RoomDeviceCard(),
            RoomDeviceCard(),
            RoomDeviceCard(),
            RoomDeviceCard()
          ],
        ),
      ),
    );
  }
}
