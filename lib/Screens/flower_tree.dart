import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';

class FlowerTree extends StatelessWidget {
  const FlowerTree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Row(
        children: <Widget>[
          FlowerTreeCard(
            image: "assets/images/66.jpg",
            title: "กุหลาบ",
            flower: "Rose",
          ),
          FlowerTreeCard(
            image: "assets/images/77.jpg",
            title: "บลูฮาวาย",
            flower: "Blue Hawaii",
          ),
          FlowerTreeCard(
            image: "assets/images/95.jpg",
            title: "ทานตะวัน",
            flower: "Sunflower",
          ),
        ],
      ),
    );
  }
}

class FlowerTreeCard extends StatelessWidget {
  const FlowerTreeCard({
    Key key, 
    this.image, 
    this.title, 
    this.flower, 
    this.prees,
  }) : super(key: key);

final String image, title, flower;
final Function prees;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container (
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: prees,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
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
                ]
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$flower".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ]
                    ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

