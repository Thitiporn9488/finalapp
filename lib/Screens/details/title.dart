import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';

class TitleAnd extends StatelessWidget {
  const TitleAnd({
    Key key, this.title, this.eng,
  }) : super(key: key);

  final String title, eng;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                    color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "$eng",
                    style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w300,
                      ),
                  ),
              ],
            ),
            ),
            
        ],
      ),
    );
  }
}

