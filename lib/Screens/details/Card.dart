import 'package:app/models/models.dart';
import 'package:app/utilities/constants.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class PlantCard extends StatelessWidget {
   final Treemodel treemodel;
  final Function press;
  const PlantCard({
    Key key,
    this.press,
    this.treemodel,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
      
        Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
        
         Image.network(treemodel.image),

          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(
                kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "${treemodel.nameTh}\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "${treemodel.nameEng}".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            
          ), 
        ]
      ),
      
      ),
     
      ],
      ),
    );
            
  }
}
