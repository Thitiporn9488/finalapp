import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:app/utilities/constants.dart';
import 'login_screen.dart';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String email,password,name;
  final database = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                userForm(),
                nameFrom(),
                passForm(),
                register(),
                back(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget register() => Container(
      width: 100.0,
      child: RaisedButton(
        color: Colors.green,
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
        child: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
      ));

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
      width: 100.0,
      child: RaisedButton(
        color: Colors.red,
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => LoginScreen(),
          );
          Navigator.push(context, route);
        },
        child: Text(
          'Cancel',
          style: TextStyle(color: Colors.white),
        ),
      ));

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Username',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      );

  Widget nameFrom() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Name',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      );

  Widget passForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Password',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      );
}
