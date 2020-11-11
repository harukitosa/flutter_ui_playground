import 'package:flutter/material.dart';

class SidebarSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidebarSample(),
    );
  }
}

//　りふぁくたりんぐ
// IconButtonにしてそっちをクリックした時に畳む
class SidebarSample extends StatefulWidget {
  @override
  _SidebarSampleState createState() => _SidebarSampleState();
}

class _SidebarSampleState extends State<SidebarSample> {
  double _marginTop = 850;
  Color _menuColor = Colors.blue[100];
  List<Widget> _list = [
    Icon(
      Icons.menu,
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_marginTop == 850) {
            _menuColor = Colors.blue[400];
            _list.add(
              SizedBox(
                height: 20,
              ),
            );
            _list.add(
              ListTile(
                title: Text(
                  '1つ目のメニュ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
            _list.add(
              ListTile(
                title: Text(
                  '2つ目のメニュ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
            _list.add(
              ListTile(
                title: Text(
                  '3つ目のメニュ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            );
            _marginTop = 0;
          } else {
            _menuColor = Colors.blue[100];
            _marginTop = 850;
            _list = [
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ];
          }
        });
        print('hello');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        margin: EdgeInsets.only(
          top: _marginTop,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 1000,
        width: 150,
        decoration: BoxDecoration(
          color: _menuColor,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: _list,
        ),
      ),
    );
  }
}
