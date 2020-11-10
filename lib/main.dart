import 'package:flutter/material.dart';
import 'package:flutter_ui_playground/loading_sample/loading_sample.dart';
import 'package:flutter_ui_playground/routing_animation/routing_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => TopPage(),
          '/loading_sample': (context) => LoadingSample(),
          '/routing_animation': (context) => Page1(),
        });
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FlatButton(
            child: Text('LoadingSample'),
            onPressed: () {
              Navigator.of(context).pushNamed('/loading_sample');
            },
          ),
          FlatButton(
            child: Text('RoutingAnimation'),
            onPressed: () {
              Navigator.of(context).pushNamed('/routing_animation');
            },
          ),
        ],
      ),
    );
  }
}
