
import 'package:app/Screens/details/show_image.dart';
import 'package:app/Screens/details/sun.dart';
import 'package:app/Screens/details/water.dart';
import 'package:app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'color_size.dart';
import 'description.dart';

class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({
  //   Key key,
  //   @required this.trees,
  // }) : super(key: key);
  final Treemodel trees;

  const DetailsScreen({Key key, this.trees}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: 20.0,
                    right: 20.0,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.green,
                        Colors.green[200],
                        Colors.green[100],
                        Colors.green[50],
                      ],
                      stops: [0.2, 0.5, 0.6, 0.8],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(trees: trees),
                      SizedBox(height: 20.0 / 2),
                      Description(trees: trees),
                      SizedBox(height: 50 / 2),  //เว้นระยะ
                      Water(trees: trees),  // ข้อมูล
                      SizedBox(height: 20.0 / 2),
                      // Sun(trees: trees),
                      SizedBox(height: 20.0 / 2),
                    ],
                  ),
                ),
                ProductTitleWithImage(trees: trees)
              ],
            ),
          )
        ],
      ),
    );
  }
}
