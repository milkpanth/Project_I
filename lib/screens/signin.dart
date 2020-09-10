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
        body: Container(
          decoration: BoxDecoration(
              //     gradient: RadialGradient(
              //   colors: <Color>[Colors.white, MyStyle().primaryColor],
              // center: Alignment(0, -0.3),
              // //   radius: 1.0,
              // )
              ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  MyStyle().setLogo(),
                  MyStyle().buildSizedBox(),
                  MyStyle().showName('GastoGo'),
                  MyStyle().buildSizedBox(),
                  userForm(),
                  MyStyle().buildSizedBox(),
                  passwordForm(),
                  loginButton(),
                  MyStyle().buildSizedBox(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget loginButton() => Container(
      width: 150.0,
      child: RaisedButton(
        color: MyStyle().darkColor,
        onPressed: () {},
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ));

  // SizedBox buildSizedBox() => SizedBox();

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: MyStyle().darkColor),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  // Text showName() => Text('GastoGo');
}
