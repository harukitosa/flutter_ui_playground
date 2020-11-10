// import 'package:intl/intl.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class LoadingSample extends StatefulWidget {
  @override
  _LoadingSampleState createState() => _LoadingSampleState();
}

class _LoadingSampleState extends State<LoadingSample> {
  final double len = 40;
  double leftPosition = 0;
  double centerPosition = 40;
  double rightPosition = 0;
  // double pi = 3.1415926535897932;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      _setPosition,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setPosition(Timer timer) {
    print(timer.toString());
    setState(() {
      if (leftPosition == 0)
        leftPosition = len;
      else
        leftPosition = 0;

      if (centerPosition == 0)
        centerPosition = len;
      else
        centerPosition = 0;

      if (rightPosition == 0)
        rightPosition = len;
      else
        rightPosition = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingSampleAnimation(
          leftPosition: leftPosition,
          centerPosition: centerPosition,
          rightPosition: rightPosition,
        ),
      ),
    );
  }
}

class LoadingSampleAnimation extends StatelessWidget {
  LoadingSampleAnimation({
    this.leftPosition,
    this.centerPosition,
    this.rightPosition,
  });
  final double leftPosition;
  final double centerPosition;
  final double rightPosition;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Box(
            pos: leftPosition,
          ),
          Box(
            pos: centerPosition,
          ),
          Box(
            pos: rightPosition,
          ),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  Box({this.pos});
  final double pos;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 15,
      height: 20 + pos,
      margin: EdgeInsets.only(bottom: pos),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,
    );
  }
}
