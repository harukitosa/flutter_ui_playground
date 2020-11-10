import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  @override
  _SquareAnimationState createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation> {
  Timer _timer;
  List<double> heightArray = new List.generate(4, (i) => 100.0);
  List<double> heightBoxArray = new List.generate(5, (i) => 0);
  @override
  void initState() {
    super.initState();
    var rng = new Random();
    heightArray[0] = 0;
    heightArray[1] = 25;
    heightArray[2] = 50;
    heightArray[3] = 75;

    heightBoxArray[0] = 0;
    heightBoxArray[1] = 25;
    heightBoxArray[2] = 50;
    heightBoxArray[3] = 75;
    heightBoxArray[4] = 100;
    _timer = new Timer.periodic(
      Duration(milliseconds: 1000),
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
      var rng = new Random();
      print(rng.nextDouble());
      var idx = 3;
      for (var i = 0; i < heightArray.length; i++) {
        // if (i == idx) {
        //   heightArray[i] = 0;
        // } else {
        heightArray[i] += 25;
        heightArray[i] %= 100;
        // }
        // if (heightArray[i] == 100) {
        //   idx = i;
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Box(
            boxLineHeight: heightArray[0],
          ),
          _Box(
            boxLineHeight: heightArray[1],
          ),
          _Box(
            boxLineHeight: heightArray[2],
          ),
          _Box(
            boxLineHeight: heightArray[3],
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  _Box({this.boxLineHeight});
  final double boxLineHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 30,
      // color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedContainer(
              width: 20,
              height: 150 - boxLineHeight,
              color: Colors.blueAccent,
              duration: Duration(milliseconds: 1000),
              curve: Curves.ease,
            ),
            AnimatedContainer(
              width: 20,
              height: boxLineHeight + 75,
              color: Colors.tealAccent,
              duration: Duration(milliseconds: 1000),
              curve: Curves.ease,
            ),
            // AnimatedContainer(
            //   width: 15,
            //   height: boxLineHeight,
            //   color: Colors.teal,
            //   duration: Duration(milliseconds: 1000),
            //   curve: Curves.fastOutSlowIn,
            // ),
          ],
        ),
      ),
    );
  }
}
