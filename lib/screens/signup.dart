import 'package:flutter/material.dart';
import 'package:gastogo/unility/style.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: ListView(
        children: <Widget>[
          MyStyle().setLogo(),
        ],
      ),
    );
  }
}
