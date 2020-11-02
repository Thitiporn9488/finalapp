import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class Description extends StatelessWidget {
  const Description({
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
            trees.detail.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
