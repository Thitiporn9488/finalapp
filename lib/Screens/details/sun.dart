import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class Sun extends StatelessWidget {
  const Sun({
    Key key,
    @required 
    this.trees,
  }) : super(key: key);

  final Treemodel trees;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 300,
          // height: 100,
          child: Text(
            trees.sun.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
