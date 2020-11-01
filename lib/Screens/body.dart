import 'package:app/Screens/title_with_more_bbtn.dart';
import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'castus_tree.dart';
import 'flower_tree.dart';
import 'header_with_seachbox.dart';
import 'recomend_plans.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {

  @override
  // bar
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
   return SingleChildScrollView(
        child: Column(
       children: <Widget>[
         HeaderWithSearchBox(size: size),
         TitleWithMoreBtn(title: "ไม้ฟอกอากาศ",press: () {}),
         RecomendsPlants(),
         TitleWithMoreBtn(title: "แคสตัส",press: () {}),
         CastusTree(),
         TitleWithMoreBtn(title: "ไม้ดอก",press: () {}),
         FlowerTree(),
         SizedBox(height: kDefaultPadding),
     ],
     ),
   );
  }
  }

