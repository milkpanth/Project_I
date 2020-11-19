import 'package:flutter/material.dart';
import 'package:gastogo/utility/my_style.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MyStyle().showLogo(),
            //showName(),
            MyStyle().showName('GastoGo'),
          ],
        ),
      ),
    );
  }

  // Text showName() => Text('GastoGo');
}
