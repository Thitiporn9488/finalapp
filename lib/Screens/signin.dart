import 'package:app/utilities/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:app/utilities/constants.dart';
import 'login_screen.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email, password, name;
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 150.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'My Tree',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      userForm(),
                      nameFrom(),
                      passForm(),
                      SizedBox(height: 10.0),
                      register(),
                      back(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget register() => Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (email == null ||
              email.isEmpty ||
              password == null ||
              password.isEmpty ||
              name == null ||
              name.isEmpty) {
            print('กรุณากรอกให้ครบ');
          } else {
            var root = database.child("user");
            root.child(email).once().then((DataSnapshot snapshot) {
              if ('${snapshot.value}' == 'null') {
                regis();
              } else {
                print('มีข้อมูลแล้ว');
              }
            });
          }
        },
       padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5, // ระยะห่างตัวหนังสือ
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );

  Future<Null> regis() async {
    var root = database.child("user");
    root.child(email).set({
      'name': name,
      'password': password,
    });
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget back() => Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => LoginScreen(),
          );
          Navigator.push(context, route);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.white,
        child: Text(
          'Cancle',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5, // ระยะห่างตัวหนังสือ
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );

  Widget userForm() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) => email = value.trim(),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                hintText: 'Enter your Username',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );

  Widget nameFrom() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) => name = value.trim(),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                hintText: 'Enter your Name',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );

  Widget passForm() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) => password = value.trim(),
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0), //ระยะตัวหนังสือ
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );
}
