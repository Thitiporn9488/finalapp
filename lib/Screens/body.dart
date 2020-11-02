import 'package:app/Screens/details/showdetail.dart';
import 'package:app/Screens/title_with_more_bbtn.dart';
import 'package:app/models/models.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'details/Card.dart';

import 'header_with_seachbox.dart';

import 'title_with_more_bbtn.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final database = FirebaseDatabase.instance.reference();
  List<Treemodel> trees = List();

  @override
  void initState() {
    super.initState();
    dataread();
  }

  Future<void> dataread() async {
    database.child('Tree').once().then((DataSnapshot snapshot) {
      Map values = snapshot.value;
      values.forEach((key, values) {
        Treemodel treemodel = Treemodel.formMap(values);
        setState(() {
          trees.add(treemodel);
          print(trees);
        });
      });
    });

  }

  // bar
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        // SingleChildScrollView(
        Column(
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        TitleWithMoreBtn(title: "ไม้ฟอกอากาศ", press: () {}),
        Expanded(
          child: GridView.builder(
            itemCount: trees.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 0.60,
            ),
            itemBuilder: (context, index) => PlantCard(
              treemodel: trees[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Showdetail(trees: trees[index]),
                ),
              ),
            ),
          ),
          //  TitleWithMoreBtn(title: "แคสตัส",press: () {}),
          //  CastusTree(),
          //  TitleWithMoreBtn(title: "ไม้ดอก",press: () {}),
          //  FlowerTree(),
          // SizedBox(height: kDefaultPadding),
        ),
      ],
    );
  }
}
