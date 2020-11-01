import 'package:flutter/material.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      title: 'My Tree',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}