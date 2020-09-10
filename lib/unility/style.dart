import 'package:flutter/material.dart';

class MyStyle {
  Text showName() => Text('GastoGo');

  Container setLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.jpg'),
    );
  }

  MyStyle();
}
