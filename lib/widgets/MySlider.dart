import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MySlider extends StatefulWidget {
  final double width;
  final double height;

  MySlider({
    this.width,
    this.height
  });

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _dragPosition;
  double _dragPercentage = 0.3;
  void _updateDragPosition(Offset val) {
    double newDragPosition = 0;
    if(val.dx <= 0) {
      newDragPosition =  0;
    }else if(val.dx >= widget.width) {
      newDragPosition = widget.width;
    }else {
      newDragPosition = val.dx;
    }
    setState(() {
      _dragPosition = newDragPosition;
      _dragPercentage = _dragPosition / widget.width;
    });
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    RenderBox box = context.findRenderObject();
    Offset offset = box.globalToLocal(update.globalPosition);
    _updateDragPosition(offset);
//    print(offset.dx);
  }

  void _onDragStart(BuildContext context, DragStartDetails start) {
    RenderBox box = context.findRenderObject();
    Offset offset = box.globalToLocal(start.globalPosition);
    _updateDragPosition(offset);
//    print(offset.dx);
  }

  void _onDragEnd(BuildContext context, DragEndDetails end) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
//          color: Colors.deepPurpleAccent,
//          width: widget.width,
//          height: widget.height,
          child: LinearPercentIndicator(
            width: widget.width,
            lineHeight: widget.height,
            percent: _dragPercentage,
//            tra: Text(
//              "${_dragPercentage*100.toInt()}",
//              style: new TextStyle(fontSize: 12.0),
//            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Color(0xffe5e5e5),
            progressColor: Color(0xff7e62f4),
          ),
        ),
        onHorizontalDragUpdate: (DragUpdateDetails update) => _onDragUpdate(context,update),
        onHorizontalDragStart: (DragStartDetails start) => _onDragStart(context, start),
        onHorizontalDragEnd: (DragEndDetails end) => _onDragEnd(context,end),
      ),
    );
  }
}
