import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';

class CastusTree extends StatelessWidget {
  const CastusTree({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
       child: Row(
        children: <Widget>[
          CastusTreeCard(
            image: "assets/images/9.jpg",
            title: "แมมขนนก",
            castus: "Feather Cactus",
            press: () {},
          ),
          CastusTreeCard(
            image: "assets/images/44.jpg",
            title: "แคคตัสหูกระต่าย ",
            castus: "Bunny Ear Cactus",
            press: () {},
          ),
          CastusTreeCard(
            image: "assets/images/55.jpg",
            title: "กระบองเพชรแม่เฒ่า ",
            castus: "Old Lady Cactus",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CastusTreeCard extends StatelessWidget {
  const CastusTreeCard({
    Key key, 
    this.image,
    this.title, 
    this.castus, 
    this.press,
  }) : super(key: key);

  final String image, title, castus;
   final Function press;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding ,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
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
                ],
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
                          text: "$castus".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                            ),
                        )
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

