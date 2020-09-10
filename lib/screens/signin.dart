import 'package:flutter/material.dart';
import 'package:gastogo/unility/style.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().setLogo(),
              showName(),
            ],
          ),
        ));
  }

  // Text showName() => Text('GastoGo');
}
