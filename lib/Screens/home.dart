import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Screens/body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}

class MyBottomNavBar {
}