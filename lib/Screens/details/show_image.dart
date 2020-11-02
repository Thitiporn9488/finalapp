import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.trees
  }) : super(key: key);

  final Treemodel trees;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 0.1),
          Container(
              width: 180,
              height: 210,
              child: Expanded(
                child: Hero(
                  tag: "${trees.nameTh}",
                  child: Image.network(
                    trees.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}