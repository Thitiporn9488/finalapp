import 'package:app/models/models.dart';
import 'package:flutter/material.dart';


class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.trees,
  }) : super(key: key);

  final Treemodel trees;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "ข้อมูลพันธ์ไม้",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 50 / 2),
              Text(
                "Detial :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}