import 'package:flutter/material.dart';

class MyStyle {
  Color textColor = Colors.blue[700];
  Color bgColor = Colors.white;

  SizedBox buildSizedBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showName(String title) => Text(title,
      style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue[700],
          fontWeight: FontWeight.bold));

  Text showText(String title) => Text(title,
      style: TextStyle(
          fontSize: 18.0,
          color: Colors.blue[700],
          fontWeight: FontWeight.bold));

  Container setLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.jpg'),
    );
  }

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/$namePic'), fit: BoxFit.cover),
    );
  }

  MyStyle();
}
