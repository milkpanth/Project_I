import 'package:flutter/material.dart';

class MyStyle {
  Color textColor = Colors.blue[800];
  Color primaryColor = Colors.green;

  Text showName(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue[800],
          fontWeight: FontWeight.bold,
        ),
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.jpg'),
    );
  }

  MyStyle();
}
