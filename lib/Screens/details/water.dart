import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class Water extends StatelessWidget {
  const Water({
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
            trees.water.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
