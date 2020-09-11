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
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          gtgLogo(),
          MyStyle().buildSizedBox(),
          appName(),
          MyStyle().buildSizedBox(),
        ],
      ),
    );
  }

  Row appName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showName('GastoGo'),
      ],
    );
  }

  Widget gtgLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().setLogo(),
        ],
      );
}
