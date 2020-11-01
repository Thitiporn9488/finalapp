import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     scrollDirection: Axis.horizontal,
               child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/45.jpg",
            title: "บอสตันเฟิร์น",
            eng: "Boston Fern",
            press: () {},
          ),
           RecomendPlantCard(
            image: "assets/images/78.jpg",
            title: "เดหลี ",
            eng: "Peace Lily",
            press: () {},
          ),
           RecomendPlantCard(
            image: "assets/images/56.jpg",
            title: "สาวน้อยประแป้ง",
            eng: "Dumbcane Exotica",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key, 
    this.image, 
    this.title, 
    this.eng, 
    this.press,
  }) : super(key: key);

  final String image, title, eng;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              
              boxShadow: [
                BoxShadow(offset: Offset(0, 10),
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
                        style: Theme.of(context).textTheme.button
                        ),
                        TextSpan(text: "$eng".toUpperCase(),
                        style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                        ),
                    ],
                    ),
                    ),
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}