import 'package:app/Screens/details/details_screen.dart';
import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class Showdetail extends StatelessWidget {
  final Treemodel trees;

  const Showdetail({Key key, this.trees}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Color(0xFF0C9869),
      appBar: buildAppBar(context),
      body: DetailsScreen(trees: trees),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(trees.nameTh,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Color(0xFF0C9869),
      elevation: 0,
    );
  }
}