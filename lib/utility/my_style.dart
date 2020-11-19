import 'package:flutter/material.dart';

class MyStyle {
  Text showName(String title) => Text(title);

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.jpg'),
    );
  }

  MyStyle();
}
