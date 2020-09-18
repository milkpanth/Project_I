import 'package:flutter/material.dart';
import 'package:gastogo/unility/normal_dialog.dart';
import 'package:gastogo/unility/style.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Field
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Container(
          decoration: BoxDecoration(
              //     gradient: RadialGradient(
              //   colors: <Color>[Colors.white, MyStyle().bgColor],
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
        color: MyStyle().textColor,
        onPressed: () {
          if (user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'Please fill username and password');
          } else {}
        },
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ));

  // SizedBox buildSizedBox() => SizedBox();

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: MyStyle().textColor),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'User :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().bgColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: MyStyle().textColor),
            labelStyle: TextStyle(color: MyStyle().textColor),
            labelText: 'Password :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().textColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().bgColor)),
          ),
        ),
      );

  // Text showName() => Text('GastoGo');
}
