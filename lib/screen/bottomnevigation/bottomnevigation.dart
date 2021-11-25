import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:havartye/constents/constant.dart';
import 'package:havartye/screen/home_page.dart';
import 'package:havartye/screen/profile_page.dart';
import 'package:havartye/screen/tree.dart';



class BottomNevigation extends StatefulWidget {


  @override
  _BottomNevigationState createState() => _BottomNevigationState();
}

class _BottomNevigationState extends State<BottomNevigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildpages(),
    bottomNavigationBar: bottomNavigationBar(),
    );
  }

  buildpages() {
    switch(index) {
      case 0:
        return HomePage();
      case 1:
        return TreePage(url: 'https://admin.havartye.com/tree/$USERNAME',);
      case 2:
        return ProfilePage();

    }
  }

  bottomNavigationBar() {
    final inactiveColor = Colors.red;
    return BottomNavyBar(
      selectedIndex: index,
      containerHeight: 50,
      onItemSelected: (index) => setState(() => this.index = index),
      items: [
        BottomNavyBarItem(
        title: Text('Home', style: TextStyle(color: Colors.black),),
        icon: Container(
            height: 20,
            width: 20,
            child: Image.asset("assets/homepage.png")),
          textAlign: TextAlign.center,
          activeColor: Colors.blue,

        ),
        BottomNavyBarItem(
            title: Text('Tree', style: TextStyle(color: Colors.black),),
            icon: Container(
                height: 28,
                width: 28,
                child: Image.asset("assets/tree.png")),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,

        ),
        BottomNavyBarItem(
            title: Text('Profile', style: TextStyle(color: Colors.black),),
            icon: Container(
                height: 20,
                width: 20,
                child: Image.asset("assets/user.png")),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,

        ),
      ],
    );
  }
}
