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
            MyStyle().showName('GastoGo'),
            userForm(),
            passwordForm(),
          ],
        ),
      ),
    );
  }

  Widget userForm() => Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_box,
            color: MyStyle().textColor,
          ),
          labelStyle: TextStyle(color: MyStyle().textColor),
          labelText: 'User : ',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));

  Widget passwordForm() => Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: MyStyle().textColor,
          ),
          labelStyle: TextStyle(color: MyStyle().textColor),
          labelText: 'Password : ',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));
}
